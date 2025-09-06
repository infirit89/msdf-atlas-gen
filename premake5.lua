include "msdfgen"

project "msdf-atlas-gen"
    kind "StaticLib"
    language "C++"
    cppdialect "C++11"
    staticruntime "off"

    targetdir ("%{prj.location}/bin/" .. outputdir)
    objdir ("%{prj.location}/bin-int/" .. outputdir)

    files
    {
        "msdf-atlas-gen/**.cpp",
        "msdf-atlas-gen/**.hpp",
        "msdf-atlas-gen/**.h"
    }

    includedirs
    {
        "msdf-atlas-gen",
        "msdfgen/",
        "msdfgen/include",
    }

    links
    {
        "msdfgen"
    }

    defines
    {
        "_CRT_SECURE_NO_WARNINGS",
        "MSDF_ATLAS_NO_ARTERY_FONT",
        "MSDFGEN_PUBLIC=",
    }

    filter "system:windows"
        architecture "x86_64"
        systemversion "latest"

        disablewarnings
        {
            4267
        }

    filter "system:macosx"
		architecture "ARM64"

    filter "configurations:Debug"
        runtime "Debug"
        symbols "on"

    filter "configurations:Release"
        runtime "Release"
        optimize "on"
