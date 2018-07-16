package com.ciroamaral.entity;

import java.io.ByteArrayInputStream;
import java.io.InputStream;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.DeleteObjectRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class HandleFiles {

	public void uploadFile(String name, InputStream file){
		System.out.println("Uploading file...");
        String SUFFIX = "/";
        String bucketName = "floorbrax";

        try {
            
            AWSCredentials credentials = new BasicAWSCredentials("AKIAIM3IDHVH37FPN7GA", "0UrV4ugXjKzl6qINxpKMQWrmAcK0WPOHiT16QFah");
            AmazonS3 s3client = new AmazonS3Client(credentials);
                       
            s3client.createBucket(bucketName);
            
            String folderName = "orders";
                
             String fileName = folderName + SUFFIX + name + ".jpg";
             s3client.putObject(new PutObjectRequest(bucketName, fileName, file,
				new ObjectMetadata())
				.withCannedAcl(CannedAccessControlList.PublicRead));
                
        }
        catch(AmazonServiceException e) {
            // The call was transmitted successfully, but Amazon S3 couldn't process 
            // it, so it returned an error response.
            e.printStackTrace();
        }
        catch(SdkClientException e) {
            // Amazon S3 couldn't be contacted for a response, or the client
            // couldn't parse the response from Amazon S3.
            e.printStackTrace();
        }
    }
	
	public void deleteFile(String file){

        try {
            AWSCredentials credentials = new BasicAWSCredentials("AKIAIM3IDHVH37FPN7GA", "0UrV4ugXjKzl6qINxpKMQWrmAcK0WPOHiT16QFah");
            AmazonS3 s3Client = new AmazonS3Client(credentials);
            s3Client.deleteObject(new DeleteObjectRequest("floorbrax", file));
        }
        catch(AmazonServiceException e) {
            // The call was transmitted successfully, but Amazon S3 couldn't process 
            // it, so it returned an error response.
            e.printStackTrace();
        }
        catch(SdkClientException e) {
            // Amazon S3 couldn't be contacted for a response, or the client
            // couldn't parse the response from Amazon S3.
            e.printStackTrace();
        }
    }
        
    public static void createFolder(String bucketName, String folderName, AmazonS3 client) {
            String SUFFIX = "/";
            // create meta-data for your folder and set content-length to 0
            ObjectMetadata metadata = new ObjectMetadata();
            metadata.setContentLength(0);
            // create empty content
            InputStream emptyContent = new ByteArrayInputStream(new byte[0]);
            // create a PutObjectRequest passing the folder name suffixed by /
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName,
                            folderName + SUFFIX, emptyContent, metadata);
            // send request to S3 to create folder
            client.putObject(putObjectRequest);
    } 
}
