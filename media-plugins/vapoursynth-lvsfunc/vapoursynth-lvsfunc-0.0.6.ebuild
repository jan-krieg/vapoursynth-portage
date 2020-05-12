# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_8 )

inherit python-single-r1 git-r3

DESCRIPTION="Light's Vapoursynth Functions"
HOMEPAGE="https://github.com/Irrational-Encoding-Wizardry/lvsfunc"

EGIT_REPO_URI="https://github.com/Irrational-Encoding-Wizardry/lvsfunc.git"
EGIT_COMMIT="32e831cf235c1264a86c7df2e9237a568d74a444"
KEYWORDS="~amd64 ~x86"

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND+="
	media-libs/vapoursynth[${PYTHON_SINGLE_USEDEP}]
	media-plugins/vapoursynth-continuityfixer
	media-plugins/vapoursynth-fvsfunc
	media-plugins/vapoursynth-havsfunc
	media-plugins/vapoursynth-kagefunc
	media-plugins/vapoursynth-mvsfunc
	media-plugins/vapoursynth-nnedi3_rpow2
	media-plugins/vapoursynth-vstaambk
	media-plugins/vsutil
"
DEPEND="${RDEPEND}"

# TODO (maybe): Optional dependencies
#     waifu2x-caffe
#     L-SMASH Source
#     d2vsource
#     FFMS2

DOCS=( "README.md" )


src_install(){
	python_domodule lvsfunc
}
