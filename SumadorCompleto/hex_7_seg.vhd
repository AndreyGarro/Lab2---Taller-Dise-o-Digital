library ieee; use ieee.std_logic_1164.all;

entity hex_7_seg is

	port(enable: in std_logic;
		inputHex: in std_logic_vector(3 downto 0);
		display: out std_logic_vector(6 downto 0));
		
end hex_7_seg;

architecture hex_7_seg_arch of hex_7_seg is

	component deco_7 port(enable: in std_logic;
								inputHex: in std_logic_vector(3 downto 0);
								display: out std_logic_vector(6 downto 0)); end component;


begin

	decoder : deco_7 port map(enable=>enable,inputHex=>inputHex,display=>display);

end hex_7_seg_arch;