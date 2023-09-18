select
    id,
    name,
    foo,
    bar,
    f,
    asdf,
    asdddd,
    aaaaaaaaaa,
    sample_func ('ghogeho') as hoge,
    test as dddddddddddddddddddddddddddddddddddddd,
    count(*) as cnt
from
    sample_table
where
    id = 1
