library ieee; use ieee.std_logic_1164.all;

entity mux_8bit is

	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		condition : in std_logic;
		c : out std_logic_vector(7 downto 0));
	
end mux_8bit;

architecture mux_8bit_arch of mux_8bit is

begin

	process(a, b, condition) begin
	
		if condition = '0' then c <= a;
		else c <= b;
		end if;
	
	end process;

end mux_8bit_arch;
