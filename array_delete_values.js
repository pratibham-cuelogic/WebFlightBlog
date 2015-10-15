var array_one = [1, 2, 3, 4, 5]
array_one.push(6, 7, 8)

var array_index = array_one.indexOf(5);
if( array_index > -1 ){
	array_one.splice(array_index, 1)
}

//alert(array_one)