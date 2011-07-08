<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml">
<body>
<div id="user">
Name: <input name="name" size="27"><br />
<fb:login-button length='long' onlogin="update_user_box();"></fb:login-button>
</div>
<script type="text/javascript"> 
function update_user_box() {
var user_box = document.getElementById("user");

user_box.innerHTML =
"<span>"
+ "<fb:profile-pic uid='loggedinuser' facebook-logo='true'></fb:profile-pic>"
+ "Welcome, <fb:name uid='loggedinuser' useyou='true'></fb:name>"
+ "</span>";

FB.XFBML.Host.parseDomTree();
}

</script>
<script type="text/javascript" src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php" mce_src="http://static.ak.connect.facebook.com/js/api_lib/v0.4/FeatureLoader.js.php"> </script>
<script type="text/javascript">
var api_key = "c6730eba8c1b289d1f95726a0668c189";
var channel_path = "xd_receiver.htm"; 
FB.init(api_key, channel_path, {"ifUserConnected": update_user_box});
</script>
</body>
</html>