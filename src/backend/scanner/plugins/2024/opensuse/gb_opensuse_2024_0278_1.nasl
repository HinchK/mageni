# SPDX-FileCopyrightText: 2024 Greenbone AG
# Some text descriptions might be excerpted from (a) referenced
# source(s), and are Copyright (C) by the respective right holder(s).
#
# SPDX-License-Identifier: GPL-2.0-only

if(description)
{
  script_oid("1.3.6.1.4.1.25623.1.0.833827");
  script_version("2024-05-16T05:05:35+0000");
  script_cve_id("CVE-2023-49933", "CVE-2023-49936", "CVE-2023-49937", "CVE-2023-49938");
  script_tag(name:"cvss_base", value:"10.0");
  script_tag(name:"cvss_base_vector", value:"AV:N/AC:L/Au:N/C:C/I:C/A:C");
  script_tag(name:"last_modification", value:"2024-05-16 05:05:35 +0000 (Thu, 16 May 2024)");
  script_tag(name:"severity_vector", value:"CVSS:3.1/AV:N/AC:L/PR:N/UI:N/S:U/C:H/I:H/A:H");
  script_tag(name:"severity_origin", value:"NVD");
  script_tag(name:"severity_date", value:"2023-12-21 17:17:34 +0000 (Thu, 21 Dec 2023)");
  script_tag(name:"creation_date", value:"2024-03-04 12:53:44 +0000 (Mon, 04 Mar 2024)");
  script_name("openSUSE: Security Advisory for slurm_20_02 (SUSE-SU-2024:0278-1)");
  script_category(ACT_GATHER_INFO);
  script_copyright("Copyright (C) 2024 Greenbone AG");
  script_family("SuSE Local Security Checks");
  script_dependencies("gather-package-list.nasl");
  script_mandatory_keys("ssh/login/suse", "ssh/login/rpms", re:"ssh/login/release=openSUSELeap15\.5");

  script_xref(name:"Advisory-ID", value:"SUSE-SU-2024:0278-1");
  script_xref(name:"URL", value:"https://lists.opensuse.org/archives/list/security-announce@lists.opensuse.org/thread/ZX326YOPYQMKFMEQHUHNNSEO776KYNS6");

  script_tag(name:"summary", value:"The remote host is missing an update for the 'slurm_20_02'
  package(s) announced via the SUSE-SU-2024:0278-1 advisory.");

  script_tag(name:"vuldetect", value:"Checks if a vulnerable package version is present on the target host.");

  script_tag(name:"insight", value:"This update for slurm_20_02 fixes the following issues:

  Security fixes:

  * CVE-2023-49933: Prevent message extension attacks that could bypass the
      message hash. (bsc#1218046)

  * CVE-2023-49936: Prevent NULL pointer dereference on `size_valp` overflow.
      (bsc#1218050)

  * CVE-2023-49937: Prevent double-xfree() on error in
      `_unpack_node_reg_resp()`. (bsc#1218051)

  * CVE-2023-49938: Prevent modified `sbcast` RPCs from opening a file with the
      wrong group permissions. (bsc#1218053)

  Other fixes:

  * Fix slurm upgrading to incompatible versions (bsc#1216869).

  ##");

  script_tag(name:"affected", value:"'slurm_20_02' package(s) on openSUSE Leap 15.5.");

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

if(release == "openSUSELeap15.5") {

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-node", rpm:"slurm_20_02-node~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpmi0_20_02-debuginfo", rpm:"libpmi0_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-munge-debuginfo", rpm:"slurm_20_02-munge-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-slurmdbd", rpm:"slurm_20_02-slurmdbd~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-lua-debuginfo", rpm:"slurm_20_02-lua-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-auth-none", rpm:"slurm_20_02-auth-none~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sjstat", rpm:"slurm_20_02-sjstat~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-config", rpm:"slurm_20_02-config~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-node-debuginfo", rpm:"slurm_20_02-node-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-pam_slurm-debuginfo", rpm:"slurm_20_02-pam_slurm-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-cray-debuginfo", rpm:"slurm_20_02-cray-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-debugsource", rpm:"slurm_20_02-debugsource~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-testsuite", rpm:"slurm_20_02-testsuite~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-hdf5", rpm:"slurm_20_02-hdf5~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sview", rpm:"slurm_20_02-sview~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-seff", rpm:"slurm_20_02-seff~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"perl-slurm_20_02", rpm:"perl-slurm_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-pam_slurm", rpm:"slurm_20_02-pam_slurm~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sview-debuginfo", rpm:"slurm_20_02-sview-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sql", rpm:"slurm_20_02-sql~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-slurmdbd-debuginfo", rpm:"slurm_20_02-slurmdbd-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpmi0_20_02", rpm:"libpmi0_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-torque", rpm:"slurm_20_02-torque~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"perl-slurm_20_02-debuginfo", rpm:"perl-slurm_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-lua", rpm:"slurm_20_02-lua~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-devel", rpm:"slurm_20_02-devel~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-munge", rpm:"slurm_20_02-munge~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-plugins-debuginfo", rpm:"slurm_20_02-plugins-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02", rpm:"slurm_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-cray", rpm:"slurm_20_02-cray~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-auth-none-debuginfo", rpm:"slurm_20_02-auth-none-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-rest", rpm:"slurm_20_02-rest~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-webdoc", rpm:"slurm_20_02-webdoc~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libnss_slurm2_20_02", rpm:"libnss_slurm2_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-openlava", rpm:"slurm_20_02-openlava~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-torque-debuginfo", rpm:"slurm_20_02-torque-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-config-man", rpm:"slurm_20_02-config-man~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-doc", rpm:"slurm_20_02-doc~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-plugins", rpm:"slurm_20_02-plugins~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libnss_slurm2_20_02-debuginfo", rpm:"libnss_slurm2_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sql-debuginfo", rpm:"slurm_20_02-sql-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-rest-debuginfo", rpm:"slurm_20_02-rest-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-debuginfo", rpm:"slurm_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-hdf5-debuginfo", rpm:"slurm_20_02-hdf5-debuginfo~20.02.7~150100.3.30.1##", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-node", rpm:"slurm_20_02-node~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpmi0_20_02-debuginfo", rpm:"libpmi0_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-munge-debuginfo", rpm:"slurm_20_02-munge-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-slurmdbd", rpm:"slurm_20_02-slurmdbd~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-lua-debuginfo", rpm:"slurm_20_02-lua-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-auth-none", rpm:"slurm_20_02-auth-none~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sjstat", rpm:"slurm_20_02-sjstat~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-config", rpm:"slurm_20_02-config~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-node-debuginfo", rpm:"slurm_20_02-node-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-pam_slurm-debuginfo", rpm:"slurm_20_02-pam_slurm-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-cray-debuginfo", rpm:"slurm_20_02-cray-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-debugsource", rpm:"slurm_20_02-debugsource~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-testsuite", rpm:"slurm_20_02-testsuite~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-hdf5", rpm:"slurm_20_02-hdf5~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sview", rpm:"slurm_20_02-sview~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-seff", rpm:"slurm_20_02-seff~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"perl-slurm_20_02", rpm:"perl-slurm_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-pam_slurm", rpm:"slurm_20_02-pam_slurm~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sview-debuginfo", rpm:"slurm_20_02-sview-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sql", rpm:"slurm_20_02-sql~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-slurmdbd-debuginfo", rpm:"slurm_20_02-slurmdbd-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libpmi0_20_02", rpm:"libpmi0_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-torque", rpm:"slurm_20_02-torque~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"perl-slurm_20_02-debuginfo", rpm:"perl-slurm_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-lua", rpm:"slurm_20_02-lua~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-devel", rpm:"slurm_20_02-devel~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-munge", rpm:"slurm_20_02-munge~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-plugins-debuginfo", rpm:"slurm_20_02-plugins-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02", rpm:"slurm_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-cray", rpm:"slurm_20_02-cray~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-auth-none-debuginfo", rpm:"slurm_20_02-auth-none-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-rest", rpm:"slurm_20_02-rest~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-webdoc", rpm:"slurm_20_02-webdoc~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libnss_slurm2_20_02", rpm:"libnss_slurm2_20_02~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-openlava", rpm:"slurm_20_02-openlava~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-torque-debuginfo", rpm:"slurm_20_02-torque-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-config-man", rpm:"slurm_20_02-config-man~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-doc", rpm:"slurm_20_02-doc~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-plugins", rpm:"slurm_20_02-plugins~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"libnss_slurm2_20_02-debuginfo", rpm:"libnss_slurm2_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-sql-debuginfo", rpm:"slurm_20_02-sql-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-rest-debuginfo", rpm:"slurm_20_02-rest-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-debuginfo", rpm:"slurm_20_02-debuginfo~20.02.7~150100.3.30.1", rls:"openSUSELeap15.5"))) {
    report += res;
  }

  if(!isnull(res = isrpmvuln(pkg:"slurm_20_02-hdf5-debuginfo", rpm:"slurm_20_02-hdf5-debuginfo~20.02.7~150100.3.30.1##", rls:"openSUSELeap15.5"))) {
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