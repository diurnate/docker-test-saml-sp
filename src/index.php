<?php
require_once(__DIR__ . '/lib/_autoload.php');
$as = new \SimpleSAML\Auth\Simple('test-sp');
if (isset($_GET['login'])) {
  $as->requireAuth(['ReturnTo' => '/']);
}
?>
<html>
  <head>
    <title>Fake Excommunity</title>
  </head>
  <body>
    <h1>Welcome to the fake excommunity.</h1>
    <h2>Recent Posts</h2>
    <p><strong>Help - My Pets Are Smoking</strong> by tallahasseejoe123</p>
    <p><strong>Garbage day is my favorite, you?</strong> by happytim62</p>
    <p><strong>anyone watching Lost?</strong> by granthus</p>
<?php
if ($as->isAuthenticated()) { ?>
  <h2>Below are the attributes you are logged in with</h2>
  <pre><?= print_r($as->getAttributes()); ?></pre>
  <h2>Logout below</h2>
  <a href="https://www.exdev.test/saml/logout">Click here to logout</a>
<?php
} else {
?>
  <h2>You are not logged in</h2>
  <a href="/?login">Click here to login to this SP</a>
<?php
}
?>
  </body>
</html>
