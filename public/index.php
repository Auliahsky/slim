<?php
    use Psr\Http\Message\ResponseInterface as Response;
    use Psr\Http\Message\ServerRequestInterface as Request;
    use Slim\Factory\AppFactory;

    require '../vendor/autoload.php';
    // require '../includes/DbConnect.php';
    require '../includes/DbOperations.php';

    $app = AppFactory::create();

    $app->addBodyParsingMiddleware();

    //Pembuatan Akun (Register)
    $app->post('/MyApi/public/createUser',function(Request $request, Response $response){
        if(!haveEmptyParameters(array('email','password','fullname','nope','alamat','kodepos','kota'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $password=$request_data['password'];
            $fullname=$request_data['fullname'];
            $nope=$request_data['nope'];
            $alamat=$request_data['alamat'];
            $kodepos=$request_data['kodepos'];
            $kota=$request_data['kota'];

            $hash_password = password_hash($password,PASSWORD_DEFAULT);

            $db=new DbOperations;

            $result = $db->createUser($email,$hash_password,$fullname,$nope,$alamat,$kodepos,$kota);

            if($result==USER_CREATED){
                $message=array();
                $message['error']=false;
                $message['message']='Akun sukses dibuat ';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(201);
            }else if($result==USER_FAILURE){
                $message=array();
                $message['error']=true;
                $message['message']='Ada beberapa masalah';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }else if($result==USER_EXIST){
                $message=array();
                $message['error']=true;
                $message['message']='user already exists';

                $response->getBody()->write(json_encode($message));
                return $response
                            ->withHeader('Content-type','application/json')
                            ->withStatus(422);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //Login Akun
    $app->post('/MyApi/public/userLogin', function(Request $request,Response $response){
        if(!haveEmptyParameters(array('email','password'),$request,$response)){
            $request_data=$request->getParsedBody();

            $email=$request_data['email'];
            $password=$request_data['password'];

            $db=new DbOperations;
            $result=$db->userLogin($email,$password);

            if($result==USER_AUTHENTICATED){
                $user=$db->getUserByEmail($email);
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='Login Successful';
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            } else if($result==USER_NOT_FOUND){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='User not exist';
                

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            } else if($result==USER_PASSWORD_DO_NOT_MATCH){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Invalid credential';

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type','application/json')
                    ->withStatus(200);
            }
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    //melihat semua data user
    $app->get('/MyApi/public/allUsers',function(Request $request,Response $response){
        $db=new DbOperations;

        $users=$db->getAllUsers();
        $response_data=array();
        $response_data['error']=false;
        $response_data['users']=$users;

        $response->getBody()->write(json_encode($response_data));

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    //update user
    $app->put('/MyApi/public/updateUser/{id}',function(Request $request,Response $response,array $args){
        $id=$args['id'];

        if(!haveEmptyParameters(array('email','name','school','id'),$request,$response)){
            $request_data=$request->getParsedBody();
            $email=$request_data['email'];
            $name=$request_data['name'];
            $school=$request_data['school'];
            $id=$request_data['id'];

            $db=new DbOperations;
            if($db->updateUser($email,$name,$school,$id)){
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='User Update Successfully';
                $user=$db->getUserByEmail($email);
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type', 'application/json')
                    ->withStatus(200);
            }else{
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Please Try Again Later';
                $user=$db->getUserByEmail($email);
                $response_data['user']=$user;

                $response->getBody()->write(json_encode($response_data));

                return $response
                    ->withHeader('Content-type', 'application/json')
                    ->withStatus(200);
            }
        }
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    $app->delete('/MyApi/public/deleteUser/{id}',function(Request $request, Response $response, array $args){
        $id=$args['id'];

        $db=new DbOperations;

        $response_data=array();
        if($db->deleteUser($id)){
            $response_data['error']=false;
            $response_data['message']='User has been deleted';
        } else{
            $response_data['error']=true;
            $response_data['message']='Please try again later';
        }

        $response->getBody()->write(json_encode($response_data));
        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(200);
    });

    $app->put('/MyApi/public/updatePassword/{id}',function(Request $request,Response $response,array $args){
        $id=$args['id'];

        if(!haveEmptyParameters(array('currentpassword','newpassword','email'),$request,$response)){
            $request_data=$request->getParsedBody();
            $currentpassword=$request_data['currentpassword'];
            $newpassword=$request_data['newpassword'];
            $email=$request_data['email'];

            $db=new DbOperations;

            $result=$db->updatePassword($currentpassword,$newpassword,$email);

            if($result==PASSWORD_CHANGED){
                $response_data=array();
                $response_data['error']=false;
                $response_data['message']='Password Changed';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }else if($result == PASSWORD_DO_NOT_MATCH){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='You have given wrong password';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }else if($result == PASSWORD_NOT_CHANGED){
                $response_data=array();
                $response_data['error']=true;
                $response_data['message']='Some error occurred';
                $response->getBody()->write(json_encode($response_data));
                return $response->withHeader('Content-type','application/json')
                                ->withStatus(200);
            }
        }

        return $response
            ->withHeader('Content-type','application/json')
            ->withStatus(422);
    });

    function haveEmptyParameters($required_params,$request,$response){
        $error=false;
        $error_params="";
        $request_params=$request->getParsedBody();

        foreach($required_params as $param){
            if(!isset($request_params[$param])||strlen($request_params[$param])<=0){
                $error=true;
                $error_params.=$param.', ';
            }
        }

        if($error){
            $error_detail=array();
            $error_detail['error']=true;
            $error_detail['message']='Required parameters'.substr($error_params,0,-2).'are missing or empty';
            $response->getBody()->write(json_encode($error_detail));
        }
        return $error;
    }

    $app->run();
?>