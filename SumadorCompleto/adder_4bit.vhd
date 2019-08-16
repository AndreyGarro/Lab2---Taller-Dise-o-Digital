library ieee; use ieee.std_logic_1164.all;

entity adder_4bit is

	port(a : in std_logic_vector(3 downto 0);
		  b : in std_logic_vector(3 downto 0);
		  cin : in std_logic;
		  c : out std_logic_vector(7 downto 0);
		  cout : out std_logic);
		  
end adder_4bit;

architecture adder_4bit_arch of adder_4bit is

	signal cout0 : std_logic;
	signal cout1 : std_logic;
	signal cout2 : std_logic;
	signal coutTemp : std_logic;
	
	component adder_1bit port(
		a : in std_logic;
		b : in std_logic;
		cin : in std_logic;
		c : out std_logic;
		cout : out std_logic);
	end component;

begin

	c(7 downto 5) <= "000";
	cout <= coutTemp;
	
	bit0 : adder_1bit port map(
		a => a(0),
		b => b(0),
		cin => cin,
		c => c(0),
		cout => cout0);
	bit1 : adder_1bit port map(
		a => a(1),
		b => b(1),
		cin => cout0,
		c => c(1),
		cout => cout1);
	bit2 : adder_1bit port map(
		a => a(2),
		b => b(2),
		cin => cout1,
		c => c(2),
		cout => cout2);
	bit3 : adder_1bit port map(
		a => a(3),
		b => b(3),
		cin => cout2,
		c => c(3),
		cout => coutTemp);
		
	process(a, b, cin) begin
	
		if coutTemp = '1' then c(4) <= '1';
		else c(4) <= '0';
		end if;
	
	end process;

end adder_4bit_arch;