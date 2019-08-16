library ieee; use ieee.std_logic_1164.all;

entity adder_1bit is

	port(a, b, cin: in std_logic;
		c, cout: out std_logic);
		
end entity;

architecture adder_1bit_arch of adder_1bit is

begin

	c <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (b and cin);

end adder_1bit_arch;
