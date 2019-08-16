library ieee; use ieee.std_logic_1164.all;

entity format_7_seg is

	port(
		a : in std_logic_vector(7 downto 0);
		comparator : in std_logic_vector(5 downto 0);
		b : out std_logic_vector(7 downto 0));

end format_7_seg;

architecture format_7_seg_arch of format_7_seg is

begin

	process(a, comparator) begin
	
		b <= a;
		if (comparator = "101000") or (comparator = "101001") then
			b(4) <= '0';
			b(5) <= '1';
		elsif (comparator = "100000") or (comparator = "100100") then
			b(4) <= '1';
		elsif comparator = "101010" then b <= "00110000";
		end if;
	
	end process;

end format_7_seg_arch;

