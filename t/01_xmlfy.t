use strict;
use Test::More tests => 13;

use SVGGraph::Pie;

my $svggraph = SVGGraph::Pie->new;
my $output1 = $svggraph->CreateGraph(
    {
	label => 'true',
	title => 'unittest',
    },
    [
	{value => 10, color => 'red',  label => 'data-1'},
	{value => 20, color => 'blue', label => 'data-2'},
    ]
);

like $output1, qr/<svg height="500" title="unittest" width="500">/i, q(title 1);
like $output1, qr/<text style="font-size:24;" x="20" y="40">unittest/i, q(title 2);
like $output1, qr/<circle style="stroke: black; fill-opacity: 0; stroke-width: 4" cx="200" r="180" cy="250" \/>/i, q(circle 1);
like $output1, qr/<text x="435" y="85">data-1/i, q(label 1);
like $output1, qr/<text x="435" y="110">data-2/i, q(label 2);
like $output1, qr/<line y1="250" style="stroke: red; stroke-width: 4" y2="70" x1="200" x2="200" \/>/i, q(line 1);
like $output1, qr/<line y1="250" style="stroke: blue; stroke-width: 4" y2="70" x1="200" x2="/i, q(line 2);

my $output2 = $svggraph->CreateGraph(
    {
	imageheight => 300,
	imagewidth  => 300,
	centertop   => 130,
	centerleft  => 130,
	radius      => 50,
	borderwidth => 1,
	paintwidth  => 1,
	label => 'true',
    },
    [
	{value => 10, color => 'rgb(255,0,0)', label => 'data-3'},
	{value => 20, color => 'rgb(0,0,255)', label => 'data-4'},
    ]
);

like $output2, qr/<svg height="300" title="" width="300">/i, q(title 3);
like $output2, qr/<circle style="stroke: black; fill-opacity: 0; stroke-width: 1" cx="130" r="50" cy="130" \/>/i, q(circle 2);
like $output2, qr/<text x="235" y="95">data-3/i, q(label 3);
like $output2, qr/<text x="235" y="120">data-4/i, q(label 4);
like $output2, qr/<line y1="130" style="stroke: rgb\(255,0,0\); stroke-width: 1" y2="80" x1="130" x2="130" \/>/i, q(line 3);
like $output2, qr/<line y1="130" style="stroke: rgb\(0,0,255\); stroke-width: 1" y2="80" x1="130" x2="/i, q(line 4);
