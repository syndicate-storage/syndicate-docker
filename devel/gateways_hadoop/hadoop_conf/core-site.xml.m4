<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!-- Put site-specific property overrides in this file. -->

<configuration>
	<property>
		<name>fs.default.name</name>
		<value>hdfs://ifdef(`DEF_MASTER_HOSTNAME',
DEF_MASTER_HOSTNAME,
localhost):8020</value>
	</property>
	<property>
		<name>hadoop.tmp.dir</name>
		<value>/home/syndicate/hdfs_data/temp</value>
	</property>
    <!-- H-Syndicate -->
	<property>
		<name>fs.hsyn.impl</name>
		<value>hsyndicate.hadoop.dfs.HSyndicateDFS</value>
		<description>hsyn:// protocol mapping for H-Syndicate.</description>
	</property>
	<property>
		<name>fs.hsyndicate.hosts</name>
		<value>ifdef(`DEF_UG_HTTP_HOSTS',
DEF_UG_HTTP_HOSTS,
localhost)</value>
	</property>
	<property>
		<name>fs.hsyndicate.port</name>
		<value>ifdef(`DEF_UG_HTTP_PORT',
DEF_UG_HTTP_PORT,
8888)</value>
	</property>
</configuration>
