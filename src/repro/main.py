import logging
import os
from typing import Annotated

import typer

log = logging.getLogger(__name__)

app = typer.Typer()

@app.command()
def main(
    force: Annotated[bool, typer.Option(envvar="FORCE")] = False,
):
    print({"input_arg": force, "input_env": os.getenv("FORCE")})
    match force:
        case True:
            log.error("ERROR: Input is Truthy")
        case False:
            log.info("Input is Falsey")

if __name__ == "__main__":
    app()
