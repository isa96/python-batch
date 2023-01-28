#!/usr/bin/python3

import os
import sqlparse
import pandas as pd
import connection

def query(sql):
    file = open(os.getcwd()+'/query/'+sql, 'r').read()
    query = sqlparse.format(file, strip_comments=True).strip()
    return query

if __name__ == '__main__':

    df = pd.read_sql(query('fact_orders.sql'), connection.database())
    df.to_sql('fact_orders', connection.warehouse(), if_exists='replace', index=False)

    df = pd.read_sql(query('dim_users.sql'), connection.database())
    df.to_sql('dim_users', connection.warehouse(), if_exists='replace', index=False)
    
    df = pd.read_sql(query('dim_orders.sql'), connection.database())
    df.to_sql('dim_orders', connection.warehouse(), if_exists='replace', index=False)