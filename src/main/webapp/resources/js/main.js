var label_email = document.getElementsByClassName('emaillabel')[0];
var label_password = document.getElementsByClassName('passwordlabel')[0];
var label_re_userpwd = document.getElementsByClassName('reuserpwdlabel')[0];
var label_userCode = document.getElementsByClassName('userCodelabel')[0];
var email = document.getElementById('email');
var password = document.getElementById('password');
var repassword = document.getElementById('repassword');
var userCode = document.getElementById('userCode');

password.addEventListener('blur', function(){
    if(password.value){
        label_password.className = 'labelactive';
    }else{
        label_password.className = '';
    }
});
userCode.addEventListener('blur',function (){
    if (userCode.value){
        label_userCode.className = 'labelactive';
    }else {
        label_userCode.className='';
    }
});
if (!email && typeof (email)!="undefined"){
    email.addEventListener('blur', function(){
        if(email.value){
            label_email.className = 'labelactive';
        }else{
            label_email.className = '';
        }
    });
}
if (!repassword && typeof (repassword)!="undefined"){
    repassword.addEventListener('blur',function () {
        if (repassword.value){
            label_re_userpwd.className = 'labelactive';
        }else {
            label_re_userpwd.className='';
        }

    });
}


function Validate(id){
    var login_form=document.getElementById('login_form');
    if ($("#password").val() != $("#repassword").val()){
        alert("两次密码不一致");
        $("#repassword").val("");
    }else
        login_form.submit();
}