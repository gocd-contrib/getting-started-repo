@ECHO OFF

echo Let us pretend that this is building something ... and takes 20 seconds

FOR /l %%A in (1, 1, 20) DO (
  ECHO Building [[01;31m %%A of 20 [00m]
  PING 192.0.2.1 -n 1 -w 1000 >NUL
)

(
  ECHO ^<html^>
  ECHO ^<body^>
  ECHO ^<h3^>An example artifact^</h3^>
  ECHO ^<pre^>
  ECHO ==== ==== ====
  ECHO An example artifact, created on:
  DATE /T
  TIME /T
  ECHO Pipeline which created it: %GO_PIPELINE_NAME%
  ECHO Pipeline counter was: %GO_PIPELINE_COUNTER%
  ECHO ==== ==== ====
  ECHO ^</pre^>
  ECHO ^<body^>
  ECHO ^</html^>
) >my-artifact.html
