# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.887388");
  script_cve_id("CVE-2024-35312", "CVE-2024-35313");
  script_tag(name:"creation_date", value:"2024-08-16 04:04:28 +0000 (Fri, 16 Aug 2024)");
  script_version("2024-09-13T05:05:46+0000");
  script_tag(name:"last_modification", value:"2024-09-13 05:05:46 +0000 (Fri, 13 Sep 2024)");
  script_tag(name:"cvss_base", value:"5.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:P/I:N/A:N");

  script_name("Fedora: Security Advisory (FEDORA-2024-c2da7f4de7)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("Fedora Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/fedora", "ssh/login/rpms", re:"ssh/login/release=FC39");

  script_xref(name:"Advisory-ID", value:"FEDORA-2024-c2da7f4de7");
  script_xref(name:"URL", value:"https://bodhi.fedoraproject.org/updates/FEDORA-2024-c2da7f4de7");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2252618");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2281499");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2281503");
  script_xref(name:"URL", value:"https://bugzilla.redhat.com/show_bug.cgi?id=2302910");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'tor' package(s) announced via the FEDORA-2024-c2da7f4de7 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"Re-add systemd-devel as build dependency so the daemon knows how to notify systemd that it was started - fixes bz#2302910");

  script_tag(name:"affected", value:"'tor' package(s) on Fedora 39.");

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

if(release == "FC39") {

  if(!isnull(res = isrpmvuln(pkg:"tor", rpm:"tor~0.4.8.12~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"tor-debuginfo", rpm:"tor-debuginfo~0.4.8.12~2.fc39", rls:"FC39"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"tor-debugsource", rpm:"tor-debugsource~0.4.8.12~2.fc39", rls:"FC39"))) {
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
