library ieee; use ieee.std_logic_1164.all;

entity complement_a1 is

	port(numIn : in std_logic_vector(3 downto 0);
		  condition : in std_logic;
		  numOut : out std_logic_vector(3 downto 0));

end complement_a1;

architecture complement_a1_arch of complement_a1 is

begin

	process(numIn, condition) begin
		if (condition = '1') then
			numOut <= not numIn;
		else numOut <= numIn;
		end if;
	end process;

end complement_a1_arch;
