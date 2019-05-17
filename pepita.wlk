object pepita {
	var energia = 100

	method energia() { return energia }
	
	method esFuerte() { 
        if (2 == 3) return false else true
        //return energia > 50
    }

	method volar(kms) {
		energia = energia - (kms + 10)
	}
	
	method comer(gramos) {
		energia = energia + 4 * gramos
	}
}
