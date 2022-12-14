import * as bodyParser from "body-parser";
import * as compression from "compression";
import * as express from "express";
import helmet from "helmet";
import * as morganLogger from "morgan";
// import { port } from "./config";

// import cors from "./middleware/cors";
// import fullUrl from "./middleware/full-url";

// import routers from "./routers";

const app = express();

const port = 8000;

app.set("trust proxy", "loopback");
app.use(compression());

app.use(bodyParser.json({ limit: "100mb" }));
app.use(bodyParser.urlencoded({ limit: "100mb", extended: true }));
// app.use(cors);
// app.use(fullUrl);
app.use(helmet());
app.use(morganLogger("dev"));

// app.use(routers);

app.listen(port, () => {
  console.info(`Listening on http://localhost:${port}. Press CTRL-C to stop\n`);
});
