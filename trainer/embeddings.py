"""
Reference implementation of node2vec. 

Author: Aditya Grover

For more details, refer to the paper:
node2vec: Scalable Feature Learning for Networks
Aditya Grover and Jure Leskovec 
Knowledge Discovery and Data Mining (KDD), 2016
"""
from trainer import node2vec
from gensim.models import Word2Vec


def learn_embeddings(walks, args):
    """
    Learn embeddings by optimizing the Skipgram objective using SGD.
    """
    walks = [list(map(str, walk)) for walk in walks]
    model = Word2Vec(
        walks,
        size=args.dimensions,
        window=args.window_size,
        min_count=0,
        sg=1,
        workers=args.workers,
        iter=args.iter,
    )

    return model.wv


def get_embeddings(nx_G, args):

    G = node2vec.Graph(nx_G, args.directed, args.p, args.q)
    G.preprocess_transition_probs()

    walks = G.simulate_walks(args.num_walks, args.walk_length)

    return learn_embeddings(walks, args)
