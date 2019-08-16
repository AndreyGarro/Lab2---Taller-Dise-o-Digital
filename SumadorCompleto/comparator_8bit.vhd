library ieee; use ieee.std_logic_1164.all;

entity comparator_8bit is

	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		result : out std_logic_vector(1 downto 0));
		
end comparator_8bit;

architecture comparator_8bit_arch of comparator_8bit is

begin

	process(a, b) begin
	
		if a < b then result <= "00";
		elsif a = b then result <= "01";
		else result <= "10";
		end if;
	
	end process;

end comparator_8bit_arch;
