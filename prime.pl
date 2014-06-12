#!perl
$n = 37;
for($i = 2; $i <= sqrt($n); $i++){
    if($n % $i == 0){
	print "n is not a prime number.";
	exit;
    }
}
#print "n is a prime number.";
