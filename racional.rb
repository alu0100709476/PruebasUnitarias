# Implementar en este fichero la clase para crear objetos racionales
# Realizado por Miguel Aurelio Garcia Gonzalez

require "./gcd.rb"

class Fraccion

	attr_accessor :n, :d

	#Inicializamos
	def initialize(n, d)

		@n = n
		@d = d		
		
	end

	# Metodo para calcular el numero relacional simplificado,
	# lo llamaremos en cada metodo para que devuelva el resultado 
	# simplificado
	def reduce

		a = @n
		b = @d

		if a < b

			x = a

		else

			x = b

		end

		reducida = false

	while (x>1 && !reducida) do

		if (a%x == 0) && (b%x == 0)

			a = a/x
			b = b/x
			reducida = true

		else

			x = x - 1

		end
		end

		@n = a
		@d = b
		self.to_s

	end

	# Metodo que devuelve una cadena con la representacion del racional
	def to_s

		"#{@n}/#{@d}"

	end

	# Metodo que devuelve un nuevo racional que multiplica al objeto que invoca el que le pasan
	# como parametro
	def *(fr2)

		Fraccion.new(@n * fr2.n, @d * fr2.d).reduce

	end

	# Metodo que devuelve un nuevo racional que divide al objeto que invoca el que le pasan
	# como parametro
	def /(fr2)

		Fraccion.new(@n * fr2.d, @d * fr2.n).reduce

	end

	# Metodo que calcula el minimo comun multiplo de dos numeros racionales
	def mcm(a, b)

		(a/gcd(a, b))*b

	end

	# Metodo que devuelve un nuevo racional que suma al objeto que invoca el que le pasan como
	# parametro
	def +(fr2)

		m = mcm(@d, fr2.d)
		Fraccion.new(((m/@d) * @n) + ((m/fr2.d) * fr2.n), m).reduce

	end

	# Metodo que devuelve un nuevo racional que suma al objeto que invoca el que le pasan como
	# parametro
	def -(fr2)

		m = mcm(@d, fr2.d)
		Fraccion.new(((m/@d) * @n) - ((m/fr2.d) * fr2.n), m).reduce

	end		

end
