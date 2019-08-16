library IEEE; use IEEE.STD_LOGIC_1164.all;

entity test is

end test;

architecture test_arch of test is
	
	component full_adder port (
				a : in std_logic_vector(3 downto 0);
				b : in std_logic_vector(3 downto 0);
				cin : in std_logic;
				enable : in std_logic;
				display1 : out std_logic_vector(6 downto 0);
				display2 : out std_logic_vector(6 downto 0);
				sign : out std_logic);
	end component;
	
	signal a : std_logic_vector(3 downto 0);
	signal b : std_logic_vector(3 downto 0);
	signal cin : std_logic;
	signal enable : std_logic;
	signal display1 : std_logic_vector(6 downto 0);
	signal display2 : std_logic_vector(6 downto 0);
	signal sign : std_logic;
	
begin

	DUT : full_adder port map(
		a => a,
		b => b,
		cin => cin,
		enable => enable,
		display1 => display1,
		display2 => display2,
		sign => sign);
		
	cin <= '0';
	enable <= '1';
	a <= "0000";
	b <= "0000" after 15 ns, "0001" after 30 ns, "0010" after 45 ns, "0011" after 60 ns,
		  "0100" after 75 ns, "0101" after 90 ns, "0110" after 105 ns, "0111" after 120 ns,
		  "1000" after 135 ns, "1001" after 150 ns, "1010" after 165 ns, "1011" after 180 ns,
		  "1100" after 195 ns, "1101" after 210 ns, "1110" after 225 ns, "1111" after 240 ns;
		  
	process begin
		wait until b = "1111";
	end process;
end test_arch;