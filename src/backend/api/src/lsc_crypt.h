/**
 * SPDX-License-Identifier: GPL-2.0-or-later
 * SPDX-FileCopyrightText: Copyright 2013-2018 Greenbone Networks GmbH
 * SPDX-FileComment: This file provides support for encrypting LSC credentials.
 * SPDX-FileContributor: Mageni Security LLC
 * 
 */

#ifndef _GVMD_LSC_CRYPT_H
#define _GVMD_LSC_CRYPT_H

#include <glib.h>

extern int disable_encrypted_credentials;

struct lsc_crypt_ctx_s;
typedef struct lsc_crypt_ctx_s *lsc_crypt_ctx_t;

lsc_crypt_ctx_t
lsc_crypt_new ();
void lsc_crypt_release (lsc_crypt_ctx_t);

int
lsc_crypt_create_key ();

void lsc_crypt_flush (lsc_crypt_ctx_t);

char *
lsc_crypt_encrypt (lsc_crypt_ctx_t, const char *, ...) G_GNUC_NULL_TERMINATED;

const char *
lsc_crypt_decrypt (lsc_crypt_ctx_t, const char *, const char *);
const char *
lsc_crypt_get_password (lsc_crypt_ctx_t, const char *);
const char *
lsc_crypt_get_private_key (lsc_crypt_ctx_t, const char *);

#endif /* not _GVMD_LSC_CRYPT_H */
