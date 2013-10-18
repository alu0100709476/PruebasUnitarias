# Implementar en este fichero las Pruebas Unitarias asociadas a la clase Fraccion
# Realizado por Miguel Aurelio Garcia Gonzalez

require "./racional.rb"
require "test/unit"

class Test_Fraccion < Test::Unit::TestCase

	def test_simple

		assert_equal("8/5", Fraccion.new(8, 5).to_s)
		assert_not_equal("3/4", (Fraccion.new(1, 2) + Fraccion.new(28, 7)).to_s)

	end

	def test_failure

		assert_equal("4/2", Fraccion.new(8, 5).to_s)

	end

end
