library ieee; use ieee.std_logic_1164.all;

entity negative_bit_4 is

	port(
		a : in std_logic_vector(7 downto 0);
		b : out std_logic_vector(7 downto 0));

end negative_bit_4;

architecture negative_bit_4_arch of negative_bit_4 is

begin

	process(a) begin
	
		b <= a;
		b(4) <= '0';
	
	end process;

end negative_bit_4_arch;