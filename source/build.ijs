NB. build

writesource_jp_ '~Addons/tables/dsv/source/source';'~Addons/tables/dsv/dsv.ijs'

(jpath '~addons/tables/dsv/dsv.ijs') (fcopynew ::0:) jpath '~Addons/tables/dsv/dsv.ijs'

f=. 3 : 0
(jpath '~Addons/tables/dsv/',y) fcopynew jpath '~Addons/tables/dsv/source/',y
(jpath '~addons/tables/dsv/',y) (fcopynew ::0:) jpath '~Addons/tables/dsv/source/',y
)

mkdir_j_ jpath '~addons/tables/dsv'
f 'manifest.ijs'
f 'history.txt'
f 'test/test_dsv.ijs'
