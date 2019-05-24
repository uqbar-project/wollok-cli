object pepita {
	var energia = 100
	
	method energia() { return energia }
	
	method esFuerte() {
        return energia > 50
    }

	method volar(kms) {
		energia = energia - (kms + null)
	}
	
	method comer(gramos) {
		energia = energia + 4 * gramos
	}
}
