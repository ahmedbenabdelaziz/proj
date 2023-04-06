import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:radrad/Views/LoginUser/Etudiant.dart';
import 'package:radrad/Views/LoginUser/prof.dart';
import '../Widgets/UserWidget/Text.dart';
import '../Widgets/UserWidget/TextFi.dart';
import '../Widgets/UserWidget/sizee.dart';
import 'BlocUser/Registre/registre_bloc.dart';

class Registre extends StatefulWidget {
  const Registre({Key? key}) : super(key: key);
  State<Registre> createState() => _RegistreState();
}
class _RegistreState extends State<Registre> {

  late RegistreBloc registreBloc;

  @override
  void initState() {
    registreBloc = BlocProvider.of<RegistreBloc>(context);
    super.initState();
  }
  TextEditingController name =TextEditingController();
  TextEditingController username =TextEditingController();
  TextEditingController password =TextEditingController();
  TextEditingController cin =TextEditingController();
  TextEditingController email =TextEditingController();
  TextEditingController phone =TextEditingController();
  TextEditingController date = TextEditingController();
  GlobalKey<FormState> fo = GlobalKey<FormState>();


  // appel de la méthode pickImage
  File? image;
  Future<void>pickImage()async{
    final pickimage= await ImagePicker().pickImage(source: ImageSource.gallery);
    if(pickimage==null)return;
    else{
      setState(() {
        image =File(pickimage.path);
        print(image);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0041c4),
      body:BlocListener<RegistreBloc, RegistreState>(
  listener: (context, state) {
    if(state is RegistreEnsegniantSuccessed){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>prof()));
    }else if(state is RegistreStudentSuccessed){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>Etudiant()));
    }
  },
  child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: fo,
          child: Column(
            children: [
              Container(
                height: 830,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(40),topRight:Radius.circular(40))
                ),
                padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 50,
                              backgroundImage:image==null?AssetImage('lib/assets/images/téléchargementt.png'):FileImage(image!) as ImageProvider)
                          ,  Positioned(
                              left: 60,
                              bottom: 0
                              ,child:IconButton(onPressed:(){
                            pickImage();
                          },icon:Icon(Icons.camera_alt_outlined,size: 30,color: Colors.white,),))
                        ],
                      ),
                    ),
                    text('name'),
                    sizeheight(10),
                    TextF("Enter Votre nom","nom ne doit pas etre vide",Icon(Icons.person)),
                    sizeheight(10),
                    text('Username'),
                    sizeheight(10),
                    TextF("Enter Votre prenom","le prenom ne doit pas etre vide",Icon(Icons.person)),
                    text('Date'),
                    sizeheight(10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFf6f7f9)
                      ),
                      child: TextFormField(
                        controller: date,
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            prefixIcon:IconButton(icon:Icon(Icons.date_range_sharp),onPressed:()async{
                              DateTime? dat=await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now());
                              if(dat!=null){
                                setState(() {
                                  String formattedDate =
                                  DateFormat('dd/MM/yyyy').format(dat);
                                  date.text=formattedDate.toString();
                                });
                              }
                            },),
                            hintText: "Entrer your Date Of Birth",
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    text('Email'),
                    sizeheight(10),
                    TextF("Enter Votre email","email ne doit pas etre vide",Icon(Icons.email)),
                    sizeheight(10),
                    text('Password'),
                    sizeheight(10),
                    TextF("Enter Votre Password","password ne doit pas etre vide",Icon(Icons.lock)),
                    sizeheight(10),
                    text('Confirm Password'),
                    sizeheight(10),
                    TextF("Confirm Votre Password","password ne doit pas etre vide",Icon(Icons.lock)),
                    sizeheight(10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFf6f7f9)
                      ),
                      child: TextFormField(
                        controller: password,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[a-zA-Z]+")),
                        ],
                        validator:(text){
                          if(text!.isEmpty){
                            return "Password cannot be vide";
                          }else if(!EmailValidator.validate(text)){
                            return "Email cannot be vide";
                          }
                        },
                        decoration: InputDecoration(
                            prefixIcon:Icon(Icons.lock),
                            hintText: "Confirm your password",
                            border: InputBorder.none
                        ),
                      ),
                    ),
                    sizeheight(10),
                    Text('Phone',style:TextStyle(color: Colors.blue,letterSpacing: 1),),
                    sizeheight(10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xFFf6f7f9)
                      ),
                      child: TextFormField(
                        controller: phone,
                        validator: (text){
                          if(text!.isEmpty || text.length<8){
                            return "Phone is not Valid";
                          }
                        },
                        maxLength: 8,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            prefixIcon:Icon(Icons.phone),
                            hintText: "Entrer your Phone Number",
                            border: InputBorder.none
                        ),

                      ),
                    ),
                    sizeheight(10),
                  GestureDetector(
                    onTap:(){
                    registreBloc.add(Registree(nom: name.text, prenom:username.text, email:email.text, password:password.text, date:date.text, telephone: phone.text, image:image!.path));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFF0041c4),
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sign in",style:TextStyle(color:Colors.white,fontWeight: FontWeight.bold))
                        ],
                      ),
                    ),
                  ),
                    Expanded(child: Container()),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Already have an account?',style:TextStyle(color:Color(0xFF628bdc)),),
                        SizedBox(width: 5,),
                        GestureDetector(
                            onTap:(){

                            }
                            ,child: Text('Sign up',style:TextStyle(color:Colors.blue),)),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
),
    );
  }
}
