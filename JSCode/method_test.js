function person ( name, age) {
    this.name = name;
    this.age = age;
    this.changeName= function ( name ) {
        this.name = name;
    }
}
var p = new person("Abhi",40 );
p.changeName("Bijith");
console.log(p.name);
