library ieee; use ieee.std_logic_1164.all;

entity negative_to_positive_view is

	port(
		a : in std_logic_vector(7 downto 0);
		negativeFlag : in std_logic_vector(1 downto 0);
		b : out std_logic_vector(7 downto 0));

end negative_to_positive_view;

architecture negative_to_positive_view_arch of negative_to_positive_view is

	signal newA : std_logic_vector(3 downto 0);
	signal newB : std_logic_vector(7 downto 0);
	signal sign : std_logic_vector(3 downto 0);
	signal cout : std_logic;
	
	component complement_a1 port(
		numIn : in std_logic_vector(3 downto 0);
		condition : in std_logic;
		numOut : out std_logic_vector(3 downto 0));
	end component;
	
	component adder_4bit port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		c : out std_logic_vector(7 downto 0);
		cout : out std_logic);
	end component;
	
	component negative_bit_4 port(
		a : in std_logic_vector(7 downto 0);
		b : out std_logic_vector(7 downto 0));
	end component;

begin

	complement : complement_a1 port map(
		numIn => a(3 downto 0),
		condition => sign(0),
		numOut => newA);
		
	adder : adder_4bit port map(
		a => newA,
		b => sign,
		cin => '0',
		c => newB,
		cout => cout);
		
	bit4 : negative_bit_4 port map(
		a => newB,
		b => b);
		
	process(a, negativeFlag) begin
	
		if negativeFlag = "00" then sign <= "0001";
		else sign <= "0000";
		end if;
	
	end process;

end negative_to_positive_view_arch;
