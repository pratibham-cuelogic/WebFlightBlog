//Object constructor
var pCard = new Object()
pCard.firstName	= "Pratibha"
pCard.lastName	= "Mishra"
pCard.contact	= 09984571261
pCard.dobYear	= 1989

console.log(pCard)

//Prototyping
function pCard2(){};  
pCard2.prototype.firstName	= "Pratibha"
pCard2.prototype.lastName	= "Mishra"
pCard2.prototype.contact	= 09984571261
pCard2.prototype.dobYear	= 1989

var pCardTwo = new pCard2()
console.log(pCardTwo)

//Function Constructor
function pCard1(firstName, lastName, contact, dobYear){
	this.firstName	= firstName;
	this.lastName	= lastName;
	this.contact	= contact;
	this.dobYear	= dobYear;
};

var pCardOne = new pCard1("Pratibha", "Mishra", 09984571261, 1989);
console.log(pCardOne);