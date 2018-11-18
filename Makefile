
GS=gs
GSFLAGS=-dNODISPLAY -dNOPAUSE -q 
GSLIBS=-P
GSTESTLIBS=-P


PS_FILES=$(shell find lib -type f -name '*.ps')
PS_TEST_FILES=$(shell find test -type f -name '*.ps')

mb: 
	$(GS) $(GSLIBS) -fmandelbrot.ps

cbs:
	$(GS) $(GSLIBS) -fcubic_burning_sheep.ps

buff:
	$(GS) $(GSLIBS) -fbuffalo.ps



color_test:
	$(GS) $(GSLIBS) -fcolor_test.ps


test:
	@$(foreach test_file, $(PS_TEST_FILES), echo $(test_file); $(GS) $(GSTESTLIBS) $(GSFLAGS) $(test_file) -c quit ; )

.PHONY: test mb cbs buff 
