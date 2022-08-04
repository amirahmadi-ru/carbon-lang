package CoolNumber api;

fn IsCool(i: i32) -> Bool {
	if (i % 7 == 0){
		return false;
	}
	else {
		return true;
	}
}

fn Main() -> i32 {
	var i: i32 = 0;
	while ( not (i==20)) {
		if (IsCool(i)) {
			Print("{0}", i);
		}
		i = i +1;
	}
	return 0;
}

