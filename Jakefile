/*
 * Jakefile
 * CPViewExample
 *
 * Created by Szabolcs Toth on February 19, 2012.
 * Copyright 2012, purzelbaum.hu All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("CPViewExample", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "CPViewExample.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("CPViewExample");
    task.setIdentifier("com.yourcompany.CPViewExample");
    task.setVersion("1.0");
    task.setAuthor("purzelbaum.hu");
    task.setEmail("feedback @nospam@ yourcompany.com");
    task.setSummary("CPViewExample");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["CPViewExample"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "CPViewExample", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "CPViewExample", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "CPViewExample"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "CPViewExample"), FILE.join("Build", "Deployment", "CPViewExample")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "CPViewExample"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "CPViewExample"), FILE.join("Build", "Desktop", "CPViewExample", "CPViewExample.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "CPViewExample", "CPViewExample.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "CPViewExample"));
    print("----------------------------");
}
