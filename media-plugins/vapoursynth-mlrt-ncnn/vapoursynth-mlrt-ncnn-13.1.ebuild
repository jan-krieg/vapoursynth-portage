# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="NCNN-based GPU (Vulkan) backend for vs-mlrt"
HOMEPAGE="https://github.com/AmusementClub/vs-mlrt#vsncnn-ncnn-based-gpu-vulkan-runtime"
EGIT_REPO_URI="https://github.com/AmusementClub/vs-mlrt.git"

if ver_test -eq 9999; then
	KEYWORDS=""
else
	EGIT_COMMIT="v${PV}"
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"
IUSE=""

RDEPEND+="
	media-libs/vapoursynth
	dev-libs/ncnn
	dev-libs/protobuf
	sci-libs/onnx
"
DEPEND="${RDEPEND}"

S="${S}/vsncnn"

src_prepare() {
	sed -i "s|find_package(protobuf REQUIRED CONFIG)|find_package(Protobuf REQUIRED)|" \
		"${S}/CMakeLists.txt" || die

	cmake_src_prepare
}

src_configure() {
	local GIT_DISCOVERY_ACROSS_FILESYSTEM=1
	local mycmakeargs=(
		-DVAPOURSYNTH_INCLUDE_DIRECTORY="/usr/include/vapoursynth"
	)
	cmake_src_configure
}

src_install() {
	insinto "/usr/$(get_libdir)/vapoursynth"
	doins "${BUILD_DIR}/libvsncnn.so"
}
