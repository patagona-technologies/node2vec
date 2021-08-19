import networkx as nx
import gcsfs


def read_graph(uri, directed=False, weighted=False):
    """
    Reads the input network in networkx.
    """
    fs = gcsfs.GCSFileSystem(project="cp-0308b")
    with fs.open(uri, "rb") as fp:
        if weighted:
            G = nx.read_edgelist(
                fp,
                nodetype=int,
                data=(("weight", float),),
                create_using=nx.DiGraph(),
            )
        else:
            G = nx.read_edgelist(fp, nodetype=int, create_using=nx.DiGraph())
            for edge in G.edges():
                G[edge[0]][edge[1]]["weight"] = 1

        if not directed:
            G = G.to_undirected()

    return G
