# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.1.4.2024.3198.1");
  script_cve_id("CVE-2023-22656", "CVE-2023-45221", "CVE-2023-47169", "CVE-2023-47282", "CVE-2023-48368");
  script_tag(name:"creation_date", value:"2024-09-11 04:26:44 +0000 (Wed, 11 Sep 2024)");
  script_version("2024-09-11T05:05:55+0000");
  script_tag(name:"last_modification", value:"2024-09-11 05:05:55 +0000 (Wed, 11 Sep 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("SUSE: Security Advisory (SUSE-SU-2024:3198-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse_sles", "ssh/login/rpms", re:"ssh/login/release=(SLES15\.0SP2)");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:3198-1");
  script_xref(name:"URL", value:"https://www.suse.com/support/update/announcement/2024/suse-su-20243198-1/");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'gstreamer-plugins-bad' package(s) announced via the SUSE-SU-2024:3198-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for gstreamer-plugins-bad fixes the following issues:

Dropped support for libmfx to fix the following CVEs:
libmfx: improper input validation (CVE-2023-48368, bsc#1226897)
libmfx: improper buffer restrictions (CVE-2023-45221, bsc#1226898)
libmfx: out-of-bounds read (CVE-2023-22656, bsc#1226899)
libmfx: out-of-bounds write (CVE-2023-47282, bsc#1226900)
libmfx: improper buffer restrictions (CVE-2023-47169, bsc#1226901)");

  script_tag(name:"affected", value:"'gstreamer-plugins-bad' package(s) on SUSE Linux Enterprise High Performance Computing 15-SP2, SUSE Linux Enterprise Server 15-SP2, SUSE Linux Enterprise Server for SAP Applications 15-SP2.");

  script_tag(name:"solution", value:"Please install the updated package(s).");

  script_tag(name:"solution_type", value:"VendorFix");
  script_tag(name:"qod_type", value:"package");

  exit(0);
}

include("revisions-lib.inc");
include("pkg-lib-rpm.inc");

release = rpm_get_ssh_release();
if(!release)
  exit(0);

res = "";
report = "";

if(release == "SLES15.0SP2") {

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad", rpm:"gstreamer-plugins-bad~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad-chromaprint", rpm:"gstreamer-plugins-bad-chromaprint~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad-chromaprint-debuginfo", rpm:"gstreamer-plugins-bad-chromaprint-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad-debuginfo", rpm:"gstreamer-plugins-bad-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad-debugsource", rpm:"gstreamer-plugins-bad-debugsource~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad-devel", rpm:"gstreamer-plugins-bad-devel~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"gstreamer-plugins-bad-lang", rpm:"gstreamer-plugins-bad-lang~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstadaptivedemux-1_0-0", rpm:"libgstadaptivedemux-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstadaptivedemux-1_0-0-debuginfo", rpm:"libgstadaptivedemux-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstbadaudio-1_0-0", rpm:"libgstbadaudio-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstbadaudio-1_0-0-debuginfo", rpm:"libgstbadaudio-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstbasecamerabinsrc-1_0-0", rpm:"libgstbasecamerabinsrc-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstbasecamerabinsrc-1_0-0-debuginfo", rpm:"libgstbasecamerabinsrc-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstcodecparsers-1_0-0", rpm:"libgstcodecparsers-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstcodecparsers-1_0-0-debuginfo", rpm:"libgstcodecparsers-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstinsertbin-1_0-0", rpm:"libgstinsertbin-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstinsertbin-1_0-0-debuginfo", rpm:"libgstinsertbin-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstisoff-1_0-0", rpm:"libgstisoff-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstisoff-1_0-0-debuginfo", rpm:"libgstisoff-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstmpegts-1_0-0", rpm:"libgstmpegts-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstmpegts-1_0-0-debuginfo", rpm:"libgstmpegts-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstphotography-1_0-0", rpm:"libgstphotography-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstphotography-1_0-0-debuginfo", rpm:"libgstphotography-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstplayer-1_0-0", rpm:"libgstplayer-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstplayer-1_0-0-debuginfo", rpm:"libgstplayer-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstsctp-1_0-0", rpm:"libgstsctp-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstsctp-1_0-0-debuginfo", rpm:"libgstsctp-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsturidownloader-1_0-0", rpm:"libgsturidownloader-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgsturidownloader-1_0-0-debuginfo", rpm:"libgsturidownloader-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstwayland-1_0-0", rpm:"libgstwayland-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstwayland-1_0-0-debuginfo", rpm:"libgstwayland-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstwebrtc-1_0-0", rpm:"libgstwebrtc-1_0-0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libgstwebrtc-1_0-0-debuginfo", rpm:"libgstwebrtc-1_0-0-debuginfo~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"typelib-1_0-GstInsertBin-1_0", rpm:"typelib-1_0-GstInsertBin-1_0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"typelib-1_0-GstMpegts-1_0", rpm:"typelib-1_0-GstMpegts-1_0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"typelib-1_0-GstPlayer-1_0", rpm:"typelib-1_0-GstPlayer-1_0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"typelib-1_0-GstWebRTC-1_0", rpm:"typelib-1_0-GstWebRTC-1_0~1.16.3~150200.4.22.1", rls:"SLES15.0SP2"))) {
    report += res;
  }

  if(report != "") {
    security_message(data:report);
  } else if(__pkg_match) {
    exit(99);
  }
  exit(0);
}

exit(0);
