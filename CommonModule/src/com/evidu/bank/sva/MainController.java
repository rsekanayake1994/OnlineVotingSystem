package com.evidu.bank.sva;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Properties;

import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

//import com.evidu.bank.entitiy.Account;
import com.evidu.bank.entitiy.AddressOpt;
import com.evidu.bank.entitiy.Dealer;
import com.evidu.bank.entitiy.TemporyAccount;
import com.evidu.bank.model.ElectionsVO;
import com.evidu.secure.Secure;

import com.mobios.util.LogUtil;



public class MainController {
	private static final MainController mc = new MainController();

	public static MainController getInstance() {
		return mc;
	}

	public List<BOApprovedStatus> getApporvalList(String SQL) throws SQLException {

		List<BOApprovedStatus> dbList = new ArrayList<BOApprovedStatus>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			System.out.println("2222222222222222222 : " + SQL);
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				// UrlTotal urlTot = new UrlTotal();
				BOApprovedStatus bas = new BOApprovedStatus();
				bas.setId(rs.getString("id"));
				bas.setRefNo(rs.getString("REF_NO"));
				bas.setAccountName(rs.getString("ACCOUNT_NAME"));
				bas.setCutomer(rs.getString("NAME"));
				bas.setMobileNo(rs.getString("MOBILE_NUMBER"));
				bas.setStatus(rs.getString("STATUS"));
				dbList.add(bas);

			}
		} catch (Exception e) {
			System.out.println("** getApporvalList **" + e.toString());
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (Exception ce) {
					ce.printStackTrace();
				}
			}
		}
		return dbList;
	}

	public List<TemporyAccount> getTempAccList(String SQL) throws SQLException {

		List<TemporyAccount> tempList = new ArrayList<TemporyAccount>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			System.out.println("Temp SQL : " + SQL);
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				// UrlTotal urlTot = new UrlTotal();
				TemporyAccount tempAcc = new TemporyAccount();
				tempAcc.setREF_NO(rs.getString("REF_NO"));
				tempAcc.setMSISDN(rs.getString("MSISDN"));
				tempAcc.setKYC_NO(rs.getString("KYC_NO"));

				tempList.add(tempAcc);
			}
		} catch (Exception e) {
			System.out.println("** getTempAccList **" + e.toString());
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (Exception ce) {
					ce.printStackTrace();
				}
			}
		}

		return tempList;
	}

	 public boolean insertData(String sql) {
		    boolean status = false;
		    Connection con = null;
		    try {
		      DatabaseController d = DatabaseController.getInstance();
		      con = DatabaseController.getConnection();
		      Statement stmt = con.createStatement();
		      stmt.execute(sql);
		      status = true;
		    }
		    catch (SQLException e) {
		      System.out.println("Error On inserting data : " + e.toString());
		    } finally {
		      if (con != null) {
		        try {
		          con.close();
		        }
		        catch (SQLException localSQLException2) {
		        }
		        con = null;
		      }
		    }

		    return status;
		  }
	
	 public boolean updateData(String sql) {
		    boolean status = false;
		    Connection con = null;
		    try {
		      DatabaseController d = DatabaseController.getInstance();
		      con = DatabaseController.getConnection();
		      Statement stmt = con.createStatement();
		      stmt.executeUpdate(sql);
		      status = true;
		    }
		    catch (SQLException e) {
		      System.out.println("Error On updating data : " + e.toString());
		    } finally {
		      if (con != null) {
		        try {
		          con.close();
		        }
		        catch (SQLException localSQLException2) {
		        }
		        con = null;
		      }
		    }

		    return status;
		  }
	
	
	
	
	 public ElectionsVO getElectionID(String SQL) {
		 ElectionsVO electionData = new ElectionsVO();
		    Connection con = null;
		    Statement st = null;
		    try
		    {
		      DatabaseController d = DatabaseController.getInstance();
		      con = DatabaseController.getConnection();
		      ResultSet rs = null;
		      st = con.createStatement();
		      rs = st.executeQuery(SQL);
		      while (rs.next()) {
		    	  electionData.setElection_id(rs.getInt("election_id"));
		    	  electionData.setElection_name(rs.getString("election_name"));
		    	  electionData.setElection_type(rs.getString("election_type"));
		    	  electionData.setFaculty(rs.getString("faculty"));
		    	  electionData.setStatus(rs.getString("status"));
		      
		      }
		    }
		    catch (Exception e) {
		      System.out.println("Error get campaign ID : " + e.toString());
		    } finally {
		      if (con != null) {
		        try {
		          con.close();
		        } catch (SQLException localSQLException1) {
		        }
		        con = null;
		      }
		    }
		    return electionData;
		  }
	
	
	
	
	public static List<AddressOpt> getParentUserList(String SQL) throws SQLException {

		List<AddressOpt> perantlist = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_DATAENTRY_USER_ID"));
				add.setOPTION_VALUE(rs.getString("TNP_DATAENTRY_USER_FULLNAME"));

				perantlist.add(add);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return perantlist;

	}

	public static String getParentuserType(String query) throws SQLException {

		String userType = "";
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			// for(String SQL :querylist){
			// System.out.print("**** UNION SQL****"+SQL);
			rs = stmt.executeQuery(query);
			while (rs.next()) {

				userType = rs.getString("USER_PARENT_USER_TYPE");

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return userType;

	}

	public BOApprovedStatus getPendingCount(String SQL) {

		// Virtual_url virtualUrlData = new Virtual_url();
		BOApprovedStatus app = new BOApprovedStatus();
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			DatabaseController dc = DatabaseController.getInstance();
			con = DatabaseController.getConnection();

			stmt = con.createStatement();

			rs = stmt.executeQuery(SQL);

			while (rs.next()) {

				app.setTotalPending(rs.getString("total_pending"));

			}

		} catch (Exception e) {
			System.out.println("Error in getPendingCount(String sql) method" + e);
			e.printStackTrace();
		}

		// to close DB connection
		finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					System.out.println("error in getPendingCount connection close " + e);
				}
				con = null;
			}
		}

		return app;
	}

	/*public List<BOApprovedStatus> getAllCustomerList(String SQL) throws SQLException {

		List<BOApprovedStatus> allCustomerList = new ArrayList<BOApprovedStatus>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {

				BOApprovedStatus boapproval = new BOApprovedStatus();

				boapproval.setId(rs.getString("id"));
				boapproval.setAccountName(rs.getString("ACCOUNT_NAME"));
				boapproval.setMobileNo(rs.getString("MOBILE_NUMBER"));
				boapproval.setCutomer(rs.getString("NAME"));
				boapproval.setFatherName(rs.getString("FATHER_NAME"));
				boapproval.setMotherName(rs.getString("MOTHER_NAME"));
				boapproval.setSpouseName(rs.getString("SPOUSE_NAME"));
				boapproval.setBirthday(rs.getString("DATE_OF_BIRTH"));
				boapproval.setProfession(rs.getString("PROFESSION"));
				boapproval.setSourceIncome(rs.getString("SOURCE_OF_INCOME"));
				boapproval.setOtherBankName(rs.getString("OTHER_ACC_BANK_NAME"));
				boapproval.setOtherAccountNo(rs.getString("OTHER_ACC_NUMBER"));
				boapproval.setOtherBranchName(rs.getString("OTHER_BRANCH_NAME"));
				boapproval.setIdType(rs.getString("ID_TYPE"));
				boapproval.setIdNumber(rs.getString("NATIONAL_ID"));
				boapproval.setMailHome(rs.getString("MAILING_ADDRESS_HOUSE_NO"));
				boapproval.setMailStreet(rs.getString("MAILING_ADDRESS_STREET"));
				boapproval.setMailCity(rs.getString("MAILING_ADDRESS_CITY"));
				boapproval.setMailstate(rs.getString("MAILING_ADDRESS_STATE"));
				boapproval.setPermentHome(rs.getString("PERMANENT_ADDRESS_HOUSE_NO"));
				boapproval.setPermanatStreet(rs.getString("PERMANENT_ADDRESS_STREET"));
				boapproval.setPermentCity(rs.getString("PERMANENT_ADDRESS_CITY"));
				boapproval.setPermanatState(rs.getString("PERMANENT_ADDRESS_STATE"));
				boapproval.setAnticipatedAmount(rs.getString("ANTICIPATED_AMOUNT"));
				boapproval.setNomineeName(rs.getString("NOMINEE_NAME"));
				boapproval.setNomineeBranch(rs.getString("NOMINEE_BRANCH_NAME"));
				boapproval.setNomineeFather(rs.getString("NOMINEE_FATHERS_NAME"));
				boapproval.setNomineeMother(rs.getString("NOMINEE_MOTHERS_NAME"));
				boapproval.setNomineeHome(rs.getString("NOMINEE_ADDRESS_HOUSE_NO"));
				boapproval.setNomineeStreet(rs.getString("NOMINEE_ADDRESS_STEET"));
				boapproval.setNomineeCity(rs.getString("NOMINEE_ADDRESS_CITY"));
				boapproval.setNomineeState(rs.getString("NOMINEE_ADDRESS_STATE"));
				boapproval.setNomineeContactNumber(rs.getString("NOMINEE_CONTACT_NO"));
				boapproval.setClientIdVerfy(rs.getString("AUTHORIZED_ID_VERIFIED"));
				boapproval.setFaceInterview(rs.getString("AUTHORIZED_INTERVIW_TAKEN"));
				boapproval.setUserImg(rs.getBlob("USER_IMAGE"));
				boapproval.setNicImg(rs.getBlob("NIC_IMAGE"));
				allCustomerList.add(boapproval);

			}
		} catch (Exception e) {
			System.out.println("** getApporvalList/// **" + e.toString());
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (Exception ce) {
					ce.printStackTrace();
				}
			}
		}
		return allCustomerList;
	}*/

	public boolean checkboxUpdate(String sql) {

		Connection con = null;
		boolean b = false;

		try {
			DatabaseController dc = DatabaseController.getInstance();
			try {
				con = DatabaseController.getConnection();
			} catch (Exception e) {
				// TODO: handle exception
			}

			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			b = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					System.out.println("error in connection close");
				}
				con = null;
			}
		}

		return b;

	}

	public boolean buttonStatusUpdate(String sql) {

		Connection con = null;
		boolean b = false;

		try {
			DatabaseController dc = DatabaseController.getInstance();
			try {
				con = DatabaseController.getConnection();
			} catch (Exception e) {
				// TODO: handle exception
			}

			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			b = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					System.out.println("error in connection close");
				}
				con = null;
			}
		}

		return b;

	}

	public boolean dropdownUpdate(String sql) {

		Connection con = null;
		boolean b = false;

		try {
			DatabaseController dc = DatabaseController.getInstance();
			try {
				con = DatabaseController.getConnection();
			} catch (Exception e) {
				// TODO: handle exception
			}

			Statement stmt = con.createStatement();
			stmt.executeUpdate(sql);
			b = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					System.out.println("error in dropdownUpdate connection close");
				}
				con = null;
			}
		}

		return b;

	}

	public byte[] getImageData(String query) {
		byte[] imgData = null;
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		Blob image = null;
		boolean q_update_status = false;

		try {

			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();

			stmt = con.createStatement();

			rs = stmt.executeQuery(query);

			if (rs.next()) {

				image = rs.getBlob(1);// blob

				// inputStream=image.getBinaryStream();
				imgData = image.getBytes(1, (int) image.length()); // array
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				stmt.close();
				con.close();
			} catch (SQLException e) {

				e.printStackTrace();

			}
		}
		return imgData;
	}

	public static List<AddressOpt> getDistric(String SQL) throws SQLException {

		List<AddressOpt> distlist = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			// for(String SQL :querylist){
			// System.out.print("**** SQL****"+SQL);
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_DISTRIC_AUTOID"));
				add.setOPTION_VALUE(rs.getString("TNP_DISTRICT_NAME"));

				distlist.add(add);

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return distlist;

	}

	public static List<AddressOpt> getThana(String SQL) throws SQLException {

		List<AddressOpt> thanalist = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			// for(String SQL :querylist){
			System.out.print("**** THANA SQL****" + SQL);
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				// String thana=rs.getString("TNP_THANA_NAME");
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_THANA_AUTOID"));
				add.setOPTION_VALUE(rs.getString("TNP_THANA_NAME"));

				/// distlist.add(add);
				thanalist.add(add);

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return thanalist;

	}

	public static List<AddressOpt> getUnion(String SQL) throws SQLException {
		List<AddressOpt> unilist = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			// for(String SQL :querylist){
			System.out.print("**** UNION SQL****" + SQL);
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_UNION_AUTOID"));
				add.setOPTION_VALUE(rs.getString("TNP_UNION_NAME"));

				// String union=rs.getString("TNP_UNION_NAME");
				unilist.add(add);

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return unilist;

	}

	public boolean insertImage(String SQL, Dealer deal, InputStream inputStream1, InputStream inputStream2,
			InputStream inputStream3, InputStream inputStream4, InputStream inputStream5, InputStream inputStream6,
			InputStream inputStream7, String user) {

		System.out.println("SQL : " + SQL);
		System.out.println("deal : " + deal.getArea());
		System.out.println("inputStream1 : " + inputStream1);
		System.out.println("inputStream2 : " + inputStream2);
		System.out.println("inputStream3 : " + inputStream3);
		System.out.println("inputStream4 : " + inputStream4);
		System.out.println("inputStream5 : " + inputStream5);
		System.out.println("inputStream6 : " + inputStream6);
		System.out.println("inputStream7 : " + inputStream7);
		System.out.println("user : " + user);

		Connection con = null;
		PreparedStatement statement;
		Date date = new Date();
		// Dealer deal = new Dealer();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);

		System.out.println(DateToStr);
		boolean st = false;
		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			statement = con.prepareStatement(SQL);
			statement.setString(1, user);
			statement.setString(2, DateToStr);
			statement.setString(3, deal.getPd_org_name());
			statement.setString(4, deal.getPd_mobile());
			statement.setString(5, deal.getRegion());
			statement.setString(6, deal.getArea());
			statement.setString(7, deal.getTerritory());
			statement.setString(8, deal.getDealer_org_name());
			statement.setString(9, deal.getDealer_org_address());
			statement.setString(10, deal.getOrg_union());
			statement.setString(11, deal.getOrg_thana());
			statement.setString(12, deal.getOrg_district());
			statement.setString(13, deal.getOrg_division());
			statement.setString(14, deal.getOrg_postCode());
			statement.setString(15, deal.getDealerName());
			statement.setString(16, deal.getDateofbirth());
			statement.setString(17, deal.getIdType());
			statement.setString(18, deal.getIdNumber());
			statement.setString(19, deal.getDealerAddress());
			statement.setString(20, deal.getDealerUnion());
			statement.setString(21, deal.getDealerThana());
			statement.setString(22, deal.getDealerDistric());
			statement.setString(23, deal.getDealerDivision());
			statement.setString(24, deal.getDealerPostCode());
			statement.setString(25, deal.getMobileNumber());
			statement.setString(26, deal.getOwnershipType());
			statement.setString(27, deal.getEmergencyContactNo());
			statement.setString(28, deal.getEmergencyName());
			statement.setString(29, deal.getRelataion());
			statement.setString(30, deal.getEmergencyAddress());
			statement.setString(31, deal.getEmergencyDistrict());
			statement.setString(32, deal.getEmergencyThana());
			statement.setString(33, deal.getEmergencyUnion());
			statement.setString(34, deal.getTradeLicences());
			statement.setString(35, deal.getTinNo());
			statement.setString(36, deal.getVatRegNo());
			statement.setString(37, deal.getAccountNo());
			statement.setString(38, deal.getBankName());
			statement.setString(39, deal.getBranchName());
			statement.setString(40, deal.getNomineeName());
			statement.setString(41, deal.getNomineeRelation());
			statement.setString(42, deal.getNomineeMobile());
			statement.setString(43, deal.getNomineeFather());
			statement.setString(43, deal.getNomineeMother());
			statement.setString(44, deal.getNomineeIdType());
			statement.setString(45, deal.getNomneeIdNo());
			statement.setString(46, deal.getNomineeAddress());
			statement.setString(47, deal.getNomineeUnion());
			statement.setString(48, deal.getNomineethana());
			statement.setString(49, deal.getNomineeeDistrict());
			statement.setString(50, deal.getNomineePostCode());
			statement.setBlob(51, inputStream1);
			statement.setBlob(52, inputStream2);
			statement.setBlob(53, inputStream3);
			statement.setBlob(54, inputStream4);
			statement.setBlob(55, inputStream5);
			statement.setBlob(56, inputStream6);
			statement.setBlob(57, inputStream7);

			// sends the statement to the database server
			int row = statement.executeUpdate();
			st = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}

		return st;
	}

	public Dealer getDealerDetail(String SQL) {

		Dealer deal = new Dealer();
		Connection con = null;
		Statement st = null;

		try {
			DatabaseController dbController = DatabaseController.getInstance();
			con = DatabaseController.getConnection();
			ResultSet rs = null;
			st = con.createStatement();
			rs = st.executeQuery(SQL);
			System.out.println("SQL " + SQL);
			while (rs.next()) {
				deal.setMobileNumber("" + rs.getString("dealer_mobileNumber"));
			}
		} catch (Exception e) {
			System.out.println("Error On getDealerDetail : " + e.toString());
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
				}
				con = null;
			}
		}
		return deal;
	}

	

	public static List<AddressOpt> getRegion(String SQL) throws SQLException {

		List<AddressOpt> regionlist = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_REGION_AUTOID"));
				add.setOPTION_VALUE(rs.getString("TNP_REGION_NAME"));

				regionlist.add(add);

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return regionlist;

	}

	

	public static List<AddressOpt> getArea(String SQL) throws SQLException {

		List<AddressOpt> arealist = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			// for(String SQL :querylist){
			// System.out.print("**** THANA SQL****"+SQL);
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				// String thana=rs.getString("TNP_THANA_NAME");
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_AREA_ID"));
				add.setOPTION_VALUE(rs.getString("TNP_AREA_NAME"));

				arealist.add(add);

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return arealist;

	}

	

	public static List<AddressOpt> getTerritory(String SQL) throws SQLException {

		List<AddressOpt> territory = new ArrayList<AddressOpt>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = connection.createStatement();

			// for(String SQL :querylist){
			System.out.print("**** TERRIORY SQL****" + SQL);
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				AddressOpt add = new AddressOpt();
				add.setOPTION_ID(rs.getString("TNP_TERRITORY_AUTOID"));
				add.setOPTION_VALUE(rs.getString("TNP_TERRITORY_NAME"));

				// String union=rs.getString("TNP_UNION_NAME");
				territory.add(add);

			}
			// }
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
				stmt.close();
			} catch (SQLException e) {

				e.printStackTrace();
			}
		}

		return territory;

	}

	boolean validator = true;

	public boolean validatePassword(String passWord, String ID) throws SQLException {
		
		System.out.println("checkpoint validatePassword");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT * FROM `tnp_password_history` WHERE TNP_PASSWORD_HISTORY_CREATED_DATE <= DATE_SUB(NOW(),INTERVAL 3 MONTH) AND TNP_PASSWORD_HISTORY_PASSWORD=? AND TNP_PASSWORD_HISTORY_UUID=?";

		try {
			Secure sec = new Secure();
			String pwd = sec.encrypt(passWord);
			//getAndGoWithKey
			
			statement = conn.prepareStatement(query);
			//statement.setString(1, passWord);
			statement.setString(1, pwd);
			statement.setString(2, ID);
			rs = statement.executeQuery();
			if (rs.next()) {
				validator = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return validator;

	}

	boolean updator1 = false;

	public boolean insertPasssword(String password, String user, String id) throws SQLException {
		DatabaseController dbController = DatabaseController.getInstance();
		Connection connection = null;
		connection = DatabaseController.getConnection();
		ResultSet rs = null;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);
		PreparedStatement statement = null;
		String query = "INSERT INTO tnp_password_history (TNP_PASSWORD_HISTORY_PASSWORD, TNP_PASSWORD_HISTORY_CREATED_DATE, TNP_PASSWORD_HISTORY_USER, TNP_PASSWORD_HISTORY_UUID) VALUES (?,?,?,?)";
		try {
			Secure sec = new Secure();
			String pwd = sec.encrypt(password);
			
			statement = connection.prepareStatement(query);
			//statement.setString(1, password);
			statement.setString(1, pwd);
			statement.setString(2, DateToStr);
			statement.setString(3, user);
			statement.setString(4, id);
			int row = statement.executeUpdate();
			updator1 = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return updator1;

	}

	boolean updator4 = false;

	public boolean updatePasssword(String password, String status, String id) throws SQLException {
		DatabaseController dbController = DatabaseController.getInstance();
		Connection connection = null;
		connection = DatabaseController.getConnection();
		ResultSet rs = null;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);
		PreparedStatement statement = null;
		String query = "UPDATE `user` SET status = ?, password=? WHERE user_id=?";
		try {
//			Secure sec = new Secure();
//			String updatePwd = sec.encrypt(password);
			
			statement = connection.prepareStatement(query);
			statement.setString(1, status);
			//statement.setString(2, password);
			statement.setString(2, password);
			statement.setString(3, id);
			int row = statement.executeUpdate();
			updator4 = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return updator4;
	}
	
	boolean updator44 = false;

	public boolean updateVoterPasssword(String password, String status, String id) throws SQLException {
		DatabaseController dbController = DatabaseController.getInstance();
		Connection connection = null;
		connection = DatabaseController.getConnection();
		ResultSet rs = null;
		Date date = new Date();
		SimpleDateFormat format = new SimpleDateFormat();
		format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String DateToStr = format.format(date);
		PreparedStatement statement = null;
		String query = "UPDATE `voter` SET login_status = ?, password=? WHERE voter_id=?";
		try {
//			Secure sec = new Secure();
//			String updatePwd = sec.encrypt(password);
			
			statement = connection.prepareStatement(query);
			statement.setString(1, status);
			//statement.setString(2, password);
			statement.setString(2, password);
			statement.setString(3, id);
			int row = statement.executeUpdate();
			updator44 = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return updator44;
	}
	
	
	
	
	
	
	

	String status;

	public String catchStatus(String user_name) throws SQLException {
		System.out.println("Check point catchStatus");
		DatabaseController dbController = new DatabaseController();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String sql = "SELECT status FROM user WHERE username=?";
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			while (rs.next()) {
				status = rs.getString("status");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		
		//System.out.println("Check point catchStatus "+status);
		return status;

	}
	
	String loginstatus;
	public String catchVoterStatus(String user_name) throws SQLException {
		System.out.println("Check point catchVoterStatus");
		DatabaseController dbController = new DatabaseController();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String sql = "SELECT login_status FROM voter WHERE username=?";
		try {
			statement = conn.prepareStatement(sql);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			while (rs.next()) {
				loginstatus = rs.getString("login_status");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				conn.close();
			}
		}
		
		//System.out.println("Check point catchStatus "+status);
		return loginstatus;

	}
	
	
	
	

	int attempt = 0;

	public int catchAttempts(String user_name) throws SQLException {
		
		System.out.println("Check point catchAttempts");
		DatabaseController dbController = new DatabaseController();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT login_attempts FROM user WHERE username=?";
		try {
			statement = conn.prepareStatement(query);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			while (rs.next()) {
				attempt = rs.getInt("login_attempts");
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// System.out.println("////////////////"+count);
		return attempt;

	}
	int loginattempt = 0;
	public int catchLoginAttempts(String user_name) throws SQLException {
		
		System.out.println("Check point catchLoginAttempts");
		DatabaseController dbController = new DatabaseController();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "SELECT login_attempts FROM voter WHERE username=?";
		try {
			statement = conn.prepareStatement(query);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			while (rs.next()) {
				loginattempt = rs.getInt("login_attempts");
			}
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		// System.out.println("////////////////"+count);
		return loginattempt;

	}
	
	
	
	
	
	

	boolean updator2 = false;

	public boolean updatStatus(int attempt, String user_name) throws SQLException {
		
		System.out.println("Check point updateAttempts");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "UPDATE `user` SET `login_attempts` = ? WHERE username=?";
		try {
			statement = conn.prepareStatement(query);
			statement.setInt(1, attempt);
			statement.setString(2, user_name);
			int row = statement.executeUpdate();
			updator2 = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return updator2;

	}
	boolean updatorNew = false;
public boolean updateStatusVoter(int attempts, String user_name) throws SQLException {
		
		System.out.println("Check point updateAttempts");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "UPDATE `voter` SET `login_attempts` = ? WHERE username=?";
		try {
			statement = conn.prepareStatement(query);
			statement.setInt(1, attempts);
			statement.setString(2, user_name);
			int row = statement.executeUpdate();
			updatorNew = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return updatorNew;

	}
	
	
	
	
	
	
	
	

	boolean updator3 = false;

	public boolean updatLOckStatus(String user_name) throws SQLException {
		System.out.println("Check point updatLOckStatus");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "UPDATE `user` SET `status` = 'LOCKED' WHERE username=?";
		try {
			statement = conn.prepareStatement(query);
			statement.setString(1, user_name);
			int row = statement.executeUpdate();
			updator3 = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return updator3;

	}
	
	boolean updator66 = false;

	public boolean updatLOckStatusVoter(String user_name) throws SQLException {
		System.out.println("Check point updatLOckStatusVoter");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection conn = null;
		conn = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String query = "UPDATE `voter` SET `login_status` = 'LOCKED' WHERE username=?";
		try {
			statement = conn.prepareStatement(query);
			statement.setString(1, user_name);
			int row = statement.executeUpdate();
			updator66 = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (conn != null) {
				try {
					conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return updator66;

	}
	
	
	
	
	
	
	
	

	boolean validator3 = false;

	public boolean catchUser(String user_name) throws SQLException {
		
		System.out.println("Check point catchUser");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String SQL = "SELECT * FROM user WHERE username=?";

		try {
			statement = con.prepareStatement(SQL);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			if (rs.next()) {
				validator3 = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return validator3;

	}
	
	
	boolean validator4 = false;

	public boolean catchUser1(String user_name) throws SQLException {
		
		System.out.println("Check point catchUser");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String SQL = "SELECT * FROM voter WHERE username=?";

		try {
			statement = con.prepareStatement(SQL);
			statement.setString(1, user_name);
			rs = statement.executeQuery();

			if (rs.next()) {
				validator4 = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}

		return validator4;

	}
	
	
	//edited by rusiru
	
	boolean validatorf=false;
public boolean forgotPassword(String email,String username) throws SQLException {
		
		System.out.println("Check point forgotpassword");
		DatabaseController dbController = DatabaseController.getInstance();
		Connection con = null;
		con = DatabaseController.getConnection();
		ResultSet rs = null;
		PreparedStatement statement = null;
		String SQL = "SELECT * FROM user WHERE email=? AND username=?";

		try {
			statement = con.prepareStatement(SQL);
			statement.setString(1, email);
			statement.setString(2, username);
			rs = statement.executeQuery();

			if (rs.next()) {
				validatorf = true;
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			if (con != null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			}
		return validatorf;
		}
	
	
String statusf;

public String catchStatusforgot(String email,String username) throws SQLException {
	System.out.println("Check point catchStatusf");
	DatabaseController dbController = new DatabaseController();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	String sql = "SELECT status FROM user WHERE email=? AND username=?";
	try {
		statement = conn.prepareStatement(sql);
		statement.setString(1, email);
		statement.setString(2, username);
		rs = statement.executeQuery();

		while (rs.next()) {
			statusf = rs.getString("status");
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			conn.close();
		}
	}
	
	//System.out.println("Check point catchStatus "+status);
	return statusf;

}
	
HttpSession ss;	
HttpServletRequest request;
boolean updatorf = false;

public boolean updateForgotPassword(int OTP,String username) throws SQLException {
	System.out.println("Check point updateForgotPassword");
	DatabaseController dbController = DatabaseController.getInstance();
	Connection conn = null;
	conn = DatabaseController.getConnection();
	ResultSet rs = null;
	PreparedStatement statement = null;
	//String logData = "";
	//ss=request.getSession(true);
	//logData =(String) ss.getAttribute("logData");
	String query = "UPDATE `user` SET `status` = 'SYSTEM_GENERATED',`password` = '"+OTP+"' WHERE username=?";
	try {
		statement = conn.prepareStatement(query);
		statement.setString(1, username);
		int row = statement.executeUpdate();
		updatorf = true;
		//LogUtil.getLog("Events").debug(logData+"Forgot password,Update 'user' Table,password: "+OTP+" ,User Name: "+username+",,,");
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	} finally {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	return updatorf;

}

boolean ifsent=false;
public boolean sendEmail(String  to,String otp,String usrName,String realName,String startdate,String enddate,String date)
{
    final String username = "uokovs@gmail.com";
    final String password = "uokovs123";
    String recipient=to;
    String[] to1 ={recipient} ;
   String subject="Online Voting System UOK !!!";
   String body="Dear ,"+realName
            + "\n\n Please use this Credintials to login to the system!\nUsername: "+usrName+"\nPassword: "+otp
            +"\n\nThe election will be held From "+startdate+" To "+enddate+" on "+date; 
 /*   Properties props = new Properties();
    props.put("mail.smtp.auth", "true");
    props.put("mail.smtp.starttls.enable", "true");
    props.put("mail.smtp.host", "smtp.gmail.com");
    props.put("mail.smtp.port", "587");

    Session session = Session.getInstance(props,
      new javax.mail.Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication(username, password);
        }
      });*/

    try {
    	
       /* Message message = new MimeMessage(session);
        message.setFrom(new InternetAddress("uokovs@gmail.com"));
        message.setRecipients(Message.RecipientType.TO,
            InternetAddress.parse(to));
        message.setSubject("Online Voting System UOK !!!");
        message.setText("Dear ,"+realName
            + "\n\n Please use this Credintials to login to the system!\nUsername: "+usrName+"\nPassword: "+otp
            +"\n\nThe election will be held From "+startdate+" To "+enddate+" on "+date);

        Transport.send(message);
*/
    	ifsent=sendFromGMail(username,password,to1,subject,body);
        System.out.println("Done");
        

    } 

    catch (Exception e) 
    {
        // throw new RuntimeException(e);
    	System.out.println(e.toString());
        System.out.println("Username or Password are incorrect ... exiting !");
        ifsent=false;
    }
	return ifsent;
}




boolean sent=false;
public boolean sendFromGMail(String from,String pass,String[] to,String subject,String body){
 Properties props = System.getProperties();
    
     
     
     String host = "smtp.gmail.com";
    

     
     
     props.put("mail.smtp.starttls.enable", "true");
     props.put("mail.smtp.host", host);
     props.put("mail.smtp.user", from);
     props.put("mail.smtp.password", pass);
     props.put("mail.smtp.port", "587");
     props.put("mail.smtp.auth", "true");

     Session session = Session.getDefaultInstance(props);
     MimeMessage message = new MimeMessage(session);

     try {
         message.setFrom(new InternetAddress(from));
         InternetAddress[] toAddress = new InternetAddress[to.length];

         // To get the array of addresses
         for( int i = 0; i < to.length; i++ ) {
             toAddress[i] = new InternetAddress(to[i]);
         }

         for( int i = 0; i < toAddress.length; i++) {
             message.addRecipient(Message.RecipientType.TO, toAddress[i]);
         }

         message.setSubject(subject);
         message.setText(body);
         Transport transport = session.getTransport("smtp");
         transport.connect(host, from, pass);
         transport.sendMessage(message, message.getAllRecipients());
         transport.close();
         
         sent=true;
     }
     catch (AddressException ae) {
         ae.printStackTrace();
     }
     catch (MessagingException me) {
         me.printStackTrace();
     }
     return sent;
 }
	






public boolean sendGoogleEmail(final String from, final String pass, String[] to, String subject, String body){
	boolean isSent = false;
	  Properties props = System.getProperties();
      String host = "smtp.gmail.com";
      props.put("mail.smtp.starttls.enable", "true");
      props.put("mail.smtp.host", host);
      props.put("mail.smtp.user", from);
      props.put("mail.smtp.password", pass);
      props.put("mail.smtp.port", "587");
      props.put("mail.smtp.auth", "true");

      Session session = Session.getDefaultInstance(props);
      MimeMessage message = new MimeMessage(session);
	
	try{
		 message.setFrom(new InternetAddress(from));
         InternetAddress[] toAddress = new InternetAddress[to.length];
         for( int i = 0; i < to.length; i++ ) {
             toAddress[i] = new InternetAddress(to[i]);
         }
         for( int i = 0; i < toAddress.length; i++) {
             message.addRecipient(Message.RecipientType.TO, toAddress[i]);
         }
         message.setSubject(subject);
         message.setText(body);
         Transport transport = session.getTransport("smtp");
         transport.connect(host, from, pass);
         transport.sendMessage(message, message.getAllRecipients());
         transport.close();
	System.out.println("Email sent successfully.");
isSent=true;
	
}
	catch(MessagingException  ae){
		ae.printStackTrace();
	}
	
return isSent;	
	

}


public boolean makeDir(String dirPath) {
    boolean dirCreation = false;
    File dir = new File(dirPath);
    try
    {
      dirCreation = dir.mkdir();
      dir.setWritable(true, false);
      dirCreation = true;
    } catch (SecurityException Se) {
      dirCreation = false;
      Se.printStackTrace();
    }

    return dirCreation;
  }






	//end
	
	
	

	public List<TemporyAccount> getTempdurationResult(String SQL) throws SQLException {

		List<TemporyAccount> tempList = new ArrayList<TemporyAccount>();
		Connection connection = null;
		DatabaseController dbController = DatabaseController.getInstance();
		connection = DatabaseController.getConnection();

		Statement stmt = null;
		ResultSet rs = null;

		try {
			System.out.println("Temp SQL : " + SQL);
			stmt = connection.createStatement();
			rs = stmt.executeQuery(SQL);
			while (rs.next()) {
				// UrlTotal urlTot = new UrlTotal();
				TemporyAccount tempAcc = new TemporyAccount();
				tempAcc.setMSISDN(rs.getString("MSISDN"));
				tempAcc.setKYC_NO(rs.getString("KYC_NO"));
				tempAcc.setCUSTOMER_NAME(rs.getString(""));
				tempAcc.setNIC(rs.getString("NIC"));

				tempList.add(tempAcc);
			}
		} catch (Exception e) {
			System.out.println("** getTempAccList **" + e.toString());
			e.printStackTrace();
		} finally {
			if (connection != null) {
				try {
					connection.close();
				} catch (Exception ce) {
					ce.printStackTrace();
				}
			}
		}

		return tempList;
	}

	
	
	
	String response1=null;
			public String SendSMS(String to,String message) throws MalformedURLException, IOException{
		
				String message1=message;
				
				String url = "https://app.notify.lk/api/v1/send?user_id=11058&api_key=oEh7wJui3ZTtvl1Fd5VP&sender_id=NotifyDEMO&to="+to+"&message="+ URLEncoder.encode(message1, "UTF-8");;
		 
				try{
				URL obj = new URL(url);
	     HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	  // optional default is GET
	     con.setRequestMethod("GET");
	        //add request header
	   //add request header
	     con.setRequestProperty("User-Agent", "Mozilla/5.0");
	   //  int responseCode = con.getResponseCode();
	     System.out.println("\nSending 'GET' request to URL : " + url);
	    // System.out.println("Response Code : " + responseCode);
	     BufferedReader in = new BufferedReader(
	             new InputStreamReader(con.getInputStream()));
	     String inputLine;
	     StringBuffer response = new StringBuffer();
	     
	     while ((inputLine = in.readLine()) != null) {
	      	response.append(inputLine);
	      }
	      in.close();
	      //print in String
	      System.out.println(response.toString());
	    //Read JSON response and print
	      JSONObject myResponse = new JSONObject(response.toString());
	      
	      System.out.println("result after Reading JSON Response");
	      System.out.println("origin- "+myResponse.getString("status"));
	      return response1=myResponse.getString("status"); 
		 
		 }catch(Exception e){
			 e.printStackTrace();
			 return response1=null; 
		 }
	}
	
	
	

}
