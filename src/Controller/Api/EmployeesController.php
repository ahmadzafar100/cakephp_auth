<?php

declare(strict_types=1);

namespace App\Controller\Api;

// use App\Controller\AppController;

use App\Controller\AppController;
use Cake\Event\EventInterface;
use Cake\Http\Exception\NotFoundException;
use Cake\ORM\TableRegistry;
use Authentication\PasswordHasher\DefaultPasswordHasher;

use App\Model\States;
use Cake\Mailer\Mailer;

/**
 * Employees Controller
 *
 * @property \App\Model\Table\EmployeesTable $Employees
 */
class EmployeesController extends AppController
{
    /**
     * Index method
     *
     * @return \Cake\Http\Response|null|void Renders view
     */

    public function initialize(): void
    {
        parent::initialize();
        $this->viewBuilder()->setClassName('Json');
        $this->States = TableRegistry::getTableLocator()->get('States');
        $this->Districts = TableRegistry::getTableLocator()->get('Districts');
    }

    public function index($id = null)
    {
        $emp = $this->Employees->find();
        $count = $emp->count();

        /* $data = "zafar@123";

        $encrypted = hash('sha256', $data);

        return $this->response->withType('application/json')
            ->withStringBody(json_encode([
                'encrypted' => $encrypted,
            ])); */

        // Encryption

        /* $key = random_bytes(32); // 256-bit key

        $data = "zafar@123";

        $encrypted = $this->encrypt($data, $key);

        return $this->response->withType('application/json')
            ->withStringBody(json_encode([
                'encrypted' => $encrypted,
                'key' => base64_encode($key) // store safely!
            ])); */

        // Decryption

        /* $key = base64_decode('guvlT/4+q69XpmFV1n47bgGRvj8b5YkpCCDaWaPmPUo=');

        $cipher = 'Ygx55MXvlUmK';
        $iv     = 'Ka5k1XgQUQBUR1vf';
        $tag    = 'XA21/x6GocJPKwNKYiYJPg==';

        $decrypt = $this->decrypt($cipher, $iv, $tag, $key);

        return $this->response->withType('application/json')
            ->withStringBody(json_encode([
                'decrypted' => $decrypt
            ])); */

        // $password = (new DefaultPasswordHasher())->hash('zafar123');

        return $this->response->withType('application/json')
            ->withStringBody(json_encode([
                'status' => true,
                'total' => $count,
                'data' => $emp
            ]));
    }

    /**
     * View method
     *
     * @param string|null $id Employee id.
     * @return \Cake\Http\Response|null|void Renders view
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function view($id)
    {
        $emp = $this->Employees->find()->where(['id' => $id]);

        if ($emp->count() > 0) {
            $emp = $emp->firstOrFail();
            return $this->response->withType('application/json')
                ->withStringBody(json_encode([
                    'status' => true,
                    'data' => $emp
                ]));
        } else {
            return $this->response->withType('application/json')
                ->withStringBody(json_encode([
                    'status' => false,
                    'data' => 'No record found'
                ]));
        }
    }

    /**
     * Add method
     *
     * @return \Cake\Http\Response|null|void Redirects on successful add, renders view otherwise.
     */
    public function add()
    {
        $employee = $this->Employees->newEmptyEntity();
        if ($this->request->is('post')) {
            $data = $this->request->getData();
            $photo = $this->request->getData('photo') ?? null;

            if (!$photo || $photo->getError() !== UPLOAD_ERR_OK) {
                return $this->response->withType('application/json')
                    ->withStringBody(json_encode([
                        'status' => false,
                        'message' => 'No file uploaded',
                    ]));
            }

            $filename = $photo->getClientFileName();
            $ex = pathinfo($filename, PATHINFO_EXTENSION);
            $filename = time() . '.' . $ex;
            $photo->moveTo(WWW_ROOT . 'img' . DS . $filename);
            $data['photo'] = $filename;

            // $data['added_by'] = $this->request->getSession()->read('Auth.User.id');
            $data['added_by'] = 1;
            $employee = $this->Employees->patchEntity($employee, $data);
            if ($this->Employees->save($employee)) {
                return $this->response->withType('application/json')
                    ->withStringBody(json_encode([
                        'status' => true,
                        'message' => 'The employee has been saved.'
                    ]));
            }
            return $this->response->withType('application/json')
                ->withStringBody(json_encode([
                    'status' => false,
                    'message' => 'The employee could not be saved. Please, try again.',
                    'error' => $employee->getErrors()
                ]));
        }
    }

    /**
     * Edit method
     *
     * @param string|null $id Employee id.
     * @return \Cake\Http\Response|null|void Redirects on successful edit, renders view otherwise.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function edit($id = null)
    {
        $this->viewBuilder()->setLayout('user');
        $employee = $this->Employees->get($id, contain: []);
        $states = $this->States->find('list', [
            'keyField' => 'id',
            'valueField' => 'name',
        ])
            ->orderAsc('name')
            ->toArray();

        $districts = $this->Districts->find('list', [
            'keyField' => 'id',
            'valueField' => 'name'
        ])->where(['state_id' => $employee->state_id])->orderAsc('name')->toArray();

        if ($this->request->is(['patch', 'post', 'put'])) {
            $data = $this->request->getData();
            $photo = $this->request->getData('photo') ?? null;
            if ($photo && $photo->getError() === UPLOAD_ERR_OK) {
                $filename = $photo->getClientFileName();
                $ex = pathinfo($filename, PATHINFO_EXTENSION);
                $filename = time() . '.' . $ex;
                $photo->moveTo(WWW_ROOT . 'img' . DS . $filename);
                $data['photo'] = $filename;
            } else {
                $data['photo'] = $employee->photo;
            }
            $employee = $this->Employees->patchEntity($employee, $data);
            if ($this->Employees->save($employee)) {
                $this->Flash->success(__('The employee has been saved.'));

                return $this->redirect(['action' => 'index']);
            }
            $this->Flash->error(__('The employee could not be saved. Please, try again.'));
        }
        $this->set(compact('employee', 'states', 'districts'));
    }

    /**
     * Delete method
     *
     * @param string|null $id Employee id.
     * @return \Cake\Http\Response|null Redirects to index.
     * @throws \Cake\Datasource\Exception\RecordNotFoundException When record not found.
     */
    public function delete($id = null)
    {
        $this->request->allowMethod(['delete']);
        $employee = $this->Employees->get($id);
        if ($this->Employees->delete($employee)) {
            return $this->response->withType('application/json')
                ->withStringBody(json_encode([
                    'status' => true,
                    'data' => 'The employee has been deleted.'
                ]));
        } else {
            return $this->response->withType('application/json')
                ->withStringBody(json_encode([
                    'status' => false,
                    'data' => 'The employee could not be deleted. Please, try again.'
                ]));
        }

        return $this->redirect(['action' => 'index']);
    }

    function deactivate($id = null)
    {
        $employee = $this->Employees->get($id);
        $employee->isactive = 0;
        if ($this->Employees->save($employee)) {
            $this->Flash->success(__('The employee has been deactivated.'));
        } else {
            $this->Flash->error(__('The employee could not be deactivated. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }

    function activate($id = null)
    {
        $employee = $this->Employees->get($id);
        $employee->isactive = 1;
        if ($this->Employees->save($employee)) {
            $this->Flash->success(__('The employee has been activated.'));
        } else {
            $this->Flash->error(__('The employee could not be activated. Please, try again.'));
        }
        return $this->redirect(['action' => 'index']);
    }

    function getDistricts()
    {
        // $this->viewBuilder()->disableAutoLayout();
        $this->autoRender = false;
        $this->request->allowMethod(['post']);
        $stateId = $this->request->getData('state_id');
        $districts = $this->Districts->find('list', [
            'keyField' => 'id',
            'valueField' => 'name'
        ])->where(['state_id' => $stateId])->orderAsc('name')->toArray();

        echo '<option value="">Select District</option>';
        foreach ($districts as $id => $val) {
            echo '<option value="' . $id . '">' . $val . '</option>';
        }
    }

    function sendEmail()
    {
        $this->viewBuilder()->setLayout('user');

        if ($this->request->is('post')) {
            $to = $this->request->getData('to');
            $subject = $this->request->getData('subject');
            $message = $this->request->getData('message');

            $mailer = new Mailer('default'); // use the "default" profile

            $mailer
                ->setFrom(['ahmadzafar100@gmail.com' => 'ahmadzafar100@gmail.com'])
                ->setTo($to)
                ->setSubject($subject)
                ->deliver($message);

            $this->Flash->success('Email sent successfully!');
            return $this->redirect(['action' => 'sendEmail']);
        }
    }
}
