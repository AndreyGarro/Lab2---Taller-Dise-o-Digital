library ieee; use ieee.std_logic_1164.all;

entity full_adder is

	port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		enable : in std_logic;
		display1 : out std_logic_vector(6 downto 0);
		display2 : out std_logic_vector(6 downto 0);
		sign : out std_logic);

end full_adder;

architecture full_adder_arch of full_adder is

	signal c : std_logic_vector(7 downto 0);
	signal cout : std_logic;
	signal modifiedB : std_logic_vector(3 downto 0);
	signal newC : std_logic_vector(7 downto 0);
	signal comparatorResults : std_logic_vector(5 downto 0);
	signal cSum : std_logic_vector(7 downto 0);
	signal isNegative : std_logic_vector(1 downto 0);
	signal newA : std_logic_vector(7 downto 0);
	signal newB : std_logic_vector(7 downto 0);
	signal positiveC : std_logic_vector(7 downto 0);
	signal comparatorNegativeResults : std_logic_vector(5 downto 0);
	signal cRes : std_logic_vector(7 downto 0);

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
	
	component comparator_8bit port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		result : out std_logic_vector(1 downto 0));
	end component;
	
	component num_to_deco_7_seg port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(5 downto 0);
		c : out std_logic_vector(7 downto 0));
	end component;
	
	component negative_to_positive_view port(
		a : in std_logic_vector(7 downto 0);
		negativeFlag : in std_logic_vector(1 downto 0);
		b : out std_logic_vector(7 downto 0));
	end component;
	
	component mux_8bit port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(7 downto 0);
		condition : in std_logic;
		c : out std_logic_vector(7 downto 0));
	end component;
	
	component hex_7_seg port(
		enable: in std_logic;
		inputHex: in std_logic_vector(3 downto 0);
		display: out std_logic_vector(6 downto 0));
	end component;
	
begin

	operationType : complement_a1 port map(
		numIn => b,
		condition => cin,
		numOut => modifiedB);

	mainAdder : adder_4bit port map(
		a => a,
		b => modifiedB,
		cin => cin,
		c => newC,
		cout => cout);
	
	--SUMA
	
	comparator9 : comparator_8bit port map(
		a => newC,
		b => "00001001",
		result => comparatorResults(5 downto 4));
		
	comparator19 : comparator_8bit port map(
		a => newC,
		b => "00010011",
		result => comparatorResults(3 downto 2));
		
	comparator29 : comparator_8bit port map(
		a => newC,
		b => "00011101",
		result => comparatorResults(1 downto 0));
		
	posAdder : num_to_deco_7_seg port map(
		a => newC,
		b => comparatorResults,
		c => cSum);
	
	--RESTA
	
	newA(7 downto 4) <= "0000";
	newA(3 downto 0) <= a;
	newB(7 downto 4) <= "0000";
	newB(3 downto 0) <= b;
	comparatorNegativeResults(3 downto 0) <= "0000";
	
	negative : comparator_8bit port map(
		a => newA,
		b => newB,
		result => isNegative);
		
	negative_to_positive : negative_to_positive_view port map(
		a => newC,
		negativeFlag => isNegative,
		b => positiveC);
		
	comparatorNegative : comparator_8bit port map(
		a => positiveC,
		b => "00001001",
		result => comparatorNegativeResults(5 downto 4));
		
	negAdder : num_to_deco_7_seg port map(
		a => positiveC,
		b => comparatorNegativeResults,
		c => cRes);
	
	--MUX
	
	selectOperation : mux_8bit port map(
		a => cSum,
		b => cRes,
		condition => cin,
		c => c);
		
	--Displays
	
	displayDecoder1 : hex_7_seg port map(
		display => display1,
		inputHex => c(3 downto 0),
		enable => enable);
		
	displayDecoder2 : hex_7_seg port map(
		display => display2,
		inputHex => c(7 downto 4),
		enable => enable);
		
	--Process
	
	process(a, b, cin, enable) begin
	
		if (isNegative = "00") and (enable = '1') and (cin = '1') then sign <= '0';
		else sign <= '1';
		end if;
	
	end process;

end full_adder_arch;