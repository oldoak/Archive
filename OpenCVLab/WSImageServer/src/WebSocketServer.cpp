#include "WebSocketServerMain.h"

void WebSocketServer::initialize(Application& self)
{
    loadConfiguration(); // load default configuration files, if present
    ServerApplication::initialize(self);
}
        
void WebSocketServer::uninitialize()
{
    ServerApplication::uninitialize();
}

void WebSocketServer::defineOptions(OptionSet& options)
{
    ServerApplication::defineOptions(options);
        
    options.addOption(
        Option("help", "h", "display help information on command line arguments")
            .required(false)
            .repeatable(false));
}

void WebSocketServer::handleOption
(const std::string& name, const std::string& value)
{
    ServerApplication::handleOption(name, value);

    if (name == "help")
            _helpRequested = true;
}

void WebSocketServer::displayHelp()
{
    HelpFormatter helpFormatter(options());
    helpFormatter.setCommand(commandName());
    helpFormatter.setUsage("OPTIONS");
    helpFormatter.setHeader
        ("A sample HTTP server supporting the WebSocket protocol.");
    helpFormatter.format(std::cout);
}

int WebSocketServer::main
(const std::vector<std::string>& args)
{
    if (_helpRequested)
    {
        displayHelp();
    }
    else
    {
        // get parameters from configuration file
        unsigned short port = 
            (unsigned short) config().getInt("WebSocketServer.port", 9980);
            
        // set-up a server socket
        ServerSocket svs(port);
        // set-up a HTTPServer instance
        HTTPServer srv(new RequestHandlerFactory, svs, new HTTPServerParams);
        // start the HTTPServer
        srv.start();
        // wait for CTRL-C or kill
        waitForTerminationRequest();
        // Stop the HTTPServer
        srv.stop();
    }
    return Application::EXIT_OK;
}
