library ieee; use ieee.std_logic_1164.all;

entity num_to_deco_7_seg is

	port(
		a : in std_logic_vector(7 downto 0);
		b : in std_logic_vector(5 downto 0);
		c : out std_logic_vector(7 downto 0));

end num_to_deco_7_seg;

architecture num_to_deco_7_seg_arch of num_to_deco_7_seg is

	signal cTest : std_logic_vector(7 downto 0);
	signal extraData : std_logic_vector(3 downto 0);
	signal cout : std_logic;
	
	component adder_4bit port(
		a : in std_logic_vector(3 downto 0);
		b : in std_logic_vector(3 downto 0);
		cin : in std_logic;
		c : out std_logic_vector(7 downto 0);
		cout : out std_logic);
	end component;
	
	component format_7_seg port(
		a : in std_logic_vector(7 downto 0);
		comparator : in std_logic_vector(5 downto 0);
		b : out std_logic_vector(7 downto 0));
	end component;

begin

	adder : adder_4bit port map(
		a => a(3 downto 0),
		b => extraData,
		cin => '0',
		c => cTest,
		cout => cout);
		
	format : format_7_seg port map(
		a => cTest,
		comparator => b,
		b => c);

	process(a, b) begin
	
		if (b = "100000") or (b = "100100") then
			extradata <= "0110";
		elsif (b = "101000") or (b = "101001") then
			extradata <= "1100";
		else extradata <= "0000";
		end if;
	
	end process;
		
end num_to_deco_7_seg_arch;