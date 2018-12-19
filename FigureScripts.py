import matplotlib as mpl


def set_style():
	mpl.rcParams['lines.linewidth'] = 0.5
	mpl.rcParams['font.size'] = 12

	mpl.rcParams['axes.labelsize'] = 5
	mpl.rcParams['axes.linewidth'] = 0.25
	mpl.rcParams['axes.spines.right'] = False
	mpl.rcParams['axes.spines.top'] = False

	mpl.rcParams['xtick.top'] = False
	mpl.rcParams['ytick.right'] = False

	mpl.rcParams['xtick.major.size'] = 1
	mpl.rcParams['xtick.major.width'] = 0.5
	mpl.rcParams['ytick.major.size'] = 1
	mpl.rcParams['ytick.major.width'] = 0.5

	mpl.rcParams['xtick.labelsize'] = 3
	mpl.rcParams['ytick.labelsize'] = 3

	mpl.rcParams['pdf.fonttype'] = 42
	mpl.rcParams['ps.fonttype'] = 42

	mpl.rcParams['savefig.dpi'] = 1000