
MR=mr -t -s

.PHONY: python haskell elisp devel

haskell:
	cabal update
	cd groups/haskell; $(MR) pull; $(MR) update

python:
	cd groups/python; $(MR) pull; $(MR) update

elisp:
	cd groups/python; $(MR) pull; $(MR) update

devel:
	cd devel; $(MR) pull; $(MR) update
