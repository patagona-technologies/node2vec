import mlflow
import hypertune

from trainer import embeddings
from trainer import inputs


def train():
    pass


def test():
    pass


def run(args):
    """
    Pipeline for representational learning for all nodes in a graph.
    """
    mlflow.set_experiment("node2vec classifier")
    with mlflow.start_run():
        mlflow.log_param("num_walks", args.num_walks)
        mlflow.log_param("walk_length", args.walk_length)
        mlflow.log_param("directed", args.directed)
        mlflow.log_param("p", args.p)
        mlflow.log_param("q", args.q)

        nx_G = inputs.read_graph(args.input, args.directed, args.weighted)
        emb = embeddings.get_embeddings(nx_G, args)
        print(emb)
        # hpt = hypertune.HyperTune()

        # hpt.report_hyperparameter_tuning_metric(
        #     hyperparameter_metric_tag="my_metric", metric_value=0
        # )
