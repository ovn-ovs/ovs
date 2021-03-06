lib_LTLIBRARIES += ovn/lib/libovn.la
ovn_lib_libovn_la_LDFLAGS = \
        -version-info $(LT_CURRENT):$(LT_REVISION):$(LT_AGE) \
        -Wl,--version-script=$(top_builddir)/ovn/lib/libovn.sym \
        $(AM_LDFLAGS)
ovn_lib_libovn_la_SOURCES = \
	ovn/lib/actions.c \
	ovn/lib/actions.h \
	ovn/lib/expr.c \
	ovn/lib/expr.h \
	ovn/lib/lex.c \
	ovn/lib/lex.h \
	ovn/lib/ovn-nb-idl.c \
	ovn/lib/ovn-nb-idl.h \
	ovn/lib/ovn-sb-idl.c \
	ovn/lib/ovn-sb-idl.h

# ovn-sb IDL
OVSIDL_BUILT += \
	$(srcdir)/ovn/lib/ovn-sb-idl.c \
	$(srcdir)/ovn/lib/ovn-sb-idl.h \
	$(srcdir)/ovn/lib/ovn-sb-idl.ovsidl
EXTRA_DIST += $(srcdir)/ovn/lib/ovn-sb-idl.ann
OVN_SB_IDL_FILES = \
	$(srcdir)/ovn/ovn-sb.ovsschema \
	$(srcdir)/ovn/lib/ovn-sb-idl.ann
$(srcdir)/ovn/lib/ovn-sb-idl.ovsidl: $(OVN_SB_IDL_FILES)
	$(AM_V_GEN)$(OVSDB_IDLC) annotate $(OVN_SB_IDL_FILES) > $@.tmp && \
	mv $@.tmp $@
CLEANFILES += ovn/lib/ovn-sb-idl.c ovn/lib/ovn-sb-idl.h

# ovn-nb IDL
OVSIDL_BUILT += \
	$(srcdir)/ovn/lib/ovn-nb-idl.c \
	$(srcdir)/ovn/lib/ovn-nb-idl.h \
	$(srcdir)/ovn/lib/ovn-nb-idl.ovsidl
EXTRA_DIST += $(srcdir)/ovn/lib/ovn-nb-idl.ann
OVN_NB_IDL_FILES = \
	$(srcdir)/ovn/ovn-nb.ovsschema \
	$(srcdir)/ovn/lib/ovn-nb-idl.ann
$(srcdir)/ovn/lib/ovn-nb-idl.ovsidl: $(OVN_NB_IDL_FILES)
	$(AM_V_GEN)$(OVSDB_IDLC) annotate $(OVN_NB_IDL_FILES) > $@.tmp && \
	mv $@.tmp $@
CLEANFILES += ovn/lib/ovn-nb-idl.c ovn/lib/ovn-nb-idl.h

