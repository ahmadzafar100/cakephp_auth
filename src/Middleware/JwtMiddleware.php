<?php

namespace App\Middleware;

use App\Utility\JwtToken;
use Cake\Http\Exception\UnauthorizedException;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;
use Cake\Http\Response;
use Cake\ORM\TableRegistry;
use Cake\Utility\Security;
use Psr\Http\Message\ResponseInterface;
use Psr\Http\Message\ServerRequestInterface;
use Psr\Http\Server\MiddlewareInterface;
use Psr\Http\Server\RequestHandlerInterface;

class JwtMiddleware implements MiddlewareInterface
{
    public function process(ServerRequestInterface $request, RequestHandlerInterface $handler): ResponseInterface
    {
        // Only protect API routes
        $path = $request->getUri()->getPath();
        if (strpos($path, '/api/') !== 0 || strpos($path, '/api/login') === 0 || strpos($path, '/api/register') === 0) {
            return $handler->handle($request);
        }

        $authHeader = $request->getHeaderLine('Authorization');

        if (!$authHeader || !preg_match('/Bearer\s+(.*)$/i', $authHeader, $matches)) {
            return $this->unauthorized("Missing or invalid Authorization header");
        }

        $token = $matches[1];

        try {
            $decoded = JWT::decode($token, new Key(Security::getSalt(), 'HS256'));
            // file_put_contents(LOGS . 'jwt-debug.log', print_r($decoded, true), FILE_APPEND);
            $request = $request->withAttribute('user', (array)$decoded->data);
        } catch (\Throwable $e) {
            return $this->unauthorized("Invalid or expired token");
        }

        // Find user & check token_version
        $users = TableRegistry::getTableLocator()->get('Users');
        $user = $users->get($decoded->data->id);

        if ($user->token_version != $decoded->token_version) {
            // TOKEN INVALID (Old token)
            // throw new UnauthorizedException("Token expired. Generate new token.");
            return $this->unauthorized("Token expired. Generate new token.");
        }

        return $handler->handle($request);
    }

    private function unauthorized(string $message): Response
    {
        $res = new Response();
        return $res->withStatus(401)
            ->withType('application/json')
            ->withStringBody(json_encode(['error' => $message]));
    }
}
