<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>

<!-- Put site-specific property overrides in this file. -->

<configuration>
	<property>
		<name>mapred.job.tracker</name>
		<value>ifdef(`DEF_MASTER_HOSTNAME',
DEF_MASTER_HOSTNAME,
localhost):8021</value>
	</property>
	<property>
		<name>mapred.compress.map.output</name>
		<value>true</value>
	</property>
	<property>
		<name>mapred.map.output.compression.codec</name>
		<value>org.apache.hadoop.io.compress.SnappyCodec</value>
	</property>
	<property>
		<name>mapred.job.reuse.jvm.num.tasks</name>
		<value>-1</value>
	</property>
	<property>
		<name>mapr.localoutput.dir</name>
		<value>/home/syndicate/hdfs_data/localoutput</value>
	</property>
	<property>
		<name>mapr.localspill.dir</name>
		<value>/home/syndicate/hdfs_data/localspill</value>
	</property>
</configuration>
